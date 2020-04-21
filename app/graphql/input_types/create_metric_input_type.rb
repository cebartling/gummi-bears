module InputTypes
  class CreateMetricInputType < Types::BaseInputObject
    description "Attributes for creating a metric and associating it to a user"
    argument :name, String, "Name associated with this metric", required: true
  end
end
