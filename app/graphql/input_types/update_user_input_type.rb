module InputTypes
  class UpdateUserInputType < Types::BaseInputObject
    description "Attributes for updating a user"
    argument :id, ID, "User's primary key identifier", required: true
    argument :first_name, String, "User's first or given name", required: false
    argument :last_name, String, "User's last or family name", required: false
    argument :username, String, "User's identity username", required: false
  end
end