namespace :financial_apis do

  desc "Retrieves the intraday time series data."
  task :intraday_time_series => :environment do
    symbols = ['MSFT']
    symbols.each do |symbol|
      Stocks::RetrieveTimeSeriesIntradayInteractor.call(symbol: symbol)
    end
  end
end