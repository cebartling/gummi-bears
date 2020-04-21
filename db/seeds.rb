require 'seeds/metrics/metrics_seed'
require 'seeds/stocks/stocks_seed'
require 'seeds/user_stocks/user_stocks_seed'
require 'seeds/users/users_seed'


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Seeds::Users::UsersSeed.execute
Seeds::Stocks::StocksSeed.execute
Seeds::Metrics::MetricsSeed.execute
Seeds::UserStocks::UserStocksSeed.execute
