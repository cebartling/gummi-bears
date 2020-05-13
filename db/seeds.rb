require 'seeds/metrics/metrics_seed'
require 'seeds/stocks/stocks_seed'
require 'seeds/user_stocks/user_stocks_seed'
require 'seeds/users/users_seed'
require 'seeds/stocks/simple_moving_average_seed'

Seeds::Users::UsersSeed.execute
Seeds::Stocks::StocksSeed.execute
Seeds::Metrics::MetricsSeed.execute
Seeds::UserStocks::UserStocksSeed.execute
Seeds::Stocks::SimpleMovingAverageSeed.execute
