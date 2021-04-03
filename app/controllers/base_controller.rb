class BaseController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate

  private

  def authenticate
    authenticate_or_request_with_http_token do |token, _options|
      user_info = verify_token(token)

      user = nil
      if user_info['users'].length > 0
        email = user_info['users'][0]['email']
        user = User.find_by(username: email)
      end

      user
    end
  end

  def current_user
    @current_user ||= authenticate
  end

  def verify_token(token)
    url = "https://identitytoolkit.googleapis.com/v1/accounts:lookup?key=#{ENV['FIREBASE_WEB_API_KEY']}"
    firebase_verification_call = HTTParty.post(url,
                                               headers: { 'Content-Type' => 'application/json' },
                                               body: { 'idToken' => token }.to_json)

    if firebase_verification_call.response.code == "200"
      parsed_response = firebase_verification_call.parsed_response
    else
      raise "Unable to verify token with identitytoolkit.googleapis.com REST API endpoint."
    end

    parsed_response
  end

end
