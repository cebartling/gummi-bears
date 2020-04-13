module Types
  class MetricType < Types::BaseObject
    field :id, ID, null: true
    field :name, String, null: false
  end
end
