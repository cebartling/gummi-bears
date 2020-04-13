module InputTypes
  class CreateUserInputType < Types::BaseInputObject
    description "Attributes for creating a user"
    argument :first_name, String, "User's first or given name", required: true
    argument :last_name, String, "User's last or family name", required: true
    argument :username, String, "User's identity username", required: true
  end
end