module Stocks
  class RefreshStockAnalyticsInteractor
    include Interactor::Organizer

    # organize Stocks::RetrieveDailyTimeSeriesEventsInteractor, Stocks::RetrieveIntradayTimeSeriesEventsInteractor, Stocks::RetrieveSimpleMovingAverageAnalyticInteractor
    organize Stocks::RetrieveDailyTimeSeriesEventsInteractor

    before do
      stock = Stock.find(context.id)
      unless stock
        context.fail!(message: 'refresh_stock_analytics.failure',
                      errors: ["Unable to find stock by ID: #{context.id}"])
      end
      context.symbol = stock.symbol
    end

    around do |interactor|
      context.start_time = Time.now
      interactor.call
      context.finish_time = Time.now
    end

    # around :time_execution
    #
    # def time_execution(interactor)
    #   context.start_time = Time.now
    #   interactor.call
    #   context.finish_time = Time.now
    # end
  end
end