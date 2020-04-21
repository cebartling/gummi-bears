module Metrics
  class CreateMetricInteractor
    include Interactor

    def call
      context.message = 'metric_create.success'
      context.errors = []
      context.metric = Metric.find_by(name: context.name)
      unless context.metric
        begin
          context.metric = Metric.create!(name: context.name)
        rescue
          context.fail!(message: 'metric_create.failure',
                        errors: ["Unable to create metric '#{context.name}'."])
        end
      end
    end
  end
end
