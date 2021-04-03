module Firebase
  module Auth

    class VerifyTokenInteractor
      include Interactor

      def call
        # context.message = 'metric_create.success'
        # context.errors = []
        # context.metric = Metric.find_by(name: context.name)
        # unless context.metric
        #   begin
        #     context.metric = Metric.create!(name: context.name)
        #   rescue
        #     context.fail!(message: 'metric_create.failure',
        #                   errors: ["Unable to create metric '#{context.name}'."])
        #   end
        # end
      end

      private

      def verify_token(token)
        url = "https://identitytoolkit.googleapis.com/v1/accounts:lookup?key=#{ENV['FIREBASE_WEB_API_KEY']}"
        firebase_verification_call = HTTParty.post(url,
                                                   headers: { 'Content-Type' => 'application/json' },
                                                   body: { 'idToken' => token }.to_json)
        if firebase_verification_call.response.code == "200"
          response = firebase_verification_call.parsed_response
        else
          raise "Unable to verify token with Firebase."
        end
        response
      end
    end

  end
end

