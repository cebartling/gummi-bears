namespace :financial_apis do

  desc "Retrieves the current price and volume data for each stock in our system."
  task :current_price_volume_data => :environment do
    stocks = Stock.all
    stocks.each do |stock|
      puts "===> Retrieving current price and volume data for #{stock.name} - #{stock.symbol}..."
      Stocks::RetrieveCurrentPriceAndVolumeInteractor.call(symbol: stock.symbol)
    end
  end

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

  desc "Retrieves the simple moving average analytic data for each stock in our system."
  task :simple_moving_average_analytic => :environment do
    stocks = Stock.all
    stocks.each do |stock|
      puts "===> Retrieving simple moving average for #{stock.name} - #{stock.symbol}..."
      Stocks::RetrieveSimpleMovingAverageAnalyticInteractor.call(symbol: stock.symbol)
      # sleep(55.seconds)
    end
  end

  desc "Retrieves the relative strength index analytic data for each stock in our system."
  task :relative_strength_index_analytic => :environment do
    stocks = Stock.all
    stocks.each do |stock|
      puts "===> Retrieving relative strength index for #{stock.name} - #{stock.symbol}..."
      Stocks::RetrieveRelativeStrengthIndexAnalyticInteractor.call(symbol: stock.symbol)
    end
  end
end