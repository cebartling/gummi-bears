namespace :financial_apis do

  desc "Retrieves the intraday time series data for each stock in our system."
  task :intraday_time_series => :environment do
    stocks = Stock.all
    stocks.each do |stock|
      puts "===> Retrieving intraday events for #{stock.name} - #{stock.symbol}..."
      Stocks::RetrieveIntradayTimeSeriesEventsInteractor.call(symbol: stock.symbol)
    end
  end

  desc "Retrieves the daily time series data for each stock in our system."
  task :daily_time_series => :environment do
    stocks = Stock.all
    stocks.each do |stock|
      puts "===> Retrieving daily events for #{stock.name} - #{stock.symbol}..."
      Stocks::RetrieveDailyTimeSeriesEventsInteractor.call(symbol: stock.symbol)
    end
  end
end