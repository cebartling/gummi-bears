class GenerateUserAuthToken < ActiveRecord::Migration[6.0]
  def change
    User.all.each do |user|
      if user.regenerate_auth_token
        puts "User auth token: #{user.auth_token}"
      end
    end
  end
end
