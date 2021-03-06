module Types
  class DateType < Types::BaseScalar
    def self.coerce_input(input_value, context)
      # Override this to prepare a client-provided GraphQL value for your Ruby code
      input_value
    end

    def self.coerce_result(ruby_value, context)
      # Override this to serialize a Ruby value for the GraphQL response
      ruby_value.to_s
    end
  end
end
