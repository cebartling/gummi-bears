module InputTypes
  class RefreshStockAnalyticsInputType < Types::BaseInputObject
    description "Attributes for refreshing the stock's analytics"
    argument :id, ID, "The stock primary key identifier", required: true
    argument :correlation_id, String, "A correlation identifier to be used for asynchronous messageing.", required: true
  end
end
