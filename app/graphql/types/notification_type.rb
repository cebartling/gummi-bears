module Types
  class NotificationType < Types::BaseObject
    field :id, ID, null: true
    field :user, Types::UserType, null: false
    field :message, String, null: false
    field :read, Boolean, null: false
    field :notification_timestamp, GraphQL::Types::ISO8601DateTime, "Notification timestamp", null: false
  end
end


