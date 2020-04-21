module Mutations
  class CreateMetricMutation < BaseMutation
    field :metric, Types::MetricType, null: true
    field :message, String, null: false
    field :errors, [String], null: false

    argument :input, InputTypes::CreateMetricInputType, required: true

    def resolve(input:)
      context = Metrics::CreateMetricInteractor.call(
        name: input.name
      )

      result = {metric: nil, message: context.message, errors: context.errors}
      if context.success?
        result = {metric: context.metric, message: context.message, errors: context.errors}
      end

      result
    end
  end
end

