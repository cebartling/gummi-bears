require 'csv'

module Seeds
  module Stocks
    class SimpleMovingAverageSeed

      def self.execute
        puts 'START: Seeding simple moving average analytics'
        csv_text = File.read(Rails.root.join('lib', 'seeds', 'stocks', 'stocks.csv'))
        csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
        csv.each do |row|
          found = Stock.find_by_symbol(row['symbol'])
          if found
            %w[open close high low].each do |series_type|
              %w[5min 15min 60min daily weekly monthly].each do |interval_type|
                [5, 20, 10, 300].each do |time_period|
                  create_analytic(found, time_period, interval_type, series_type)
                end
              end
            end
          end
        end
        puts 'FINISH: Seeding simple moving average analytics'
      end

      private

      def self.create_analytic(stock, time_period, interval_type, series_type)
        unless SimpleMovingAverageAnalytic.find_by(stock: stock, interval_type: interval_type,
                                                     series_type: series_type, time_period: time_period)
          SimpleMovingAverageAnalytic.create!(
            stock: stock,
            interval_type: interval_type,
            series_type: series_type,
            time_period: time_period
          )
          puts "  Created a new simple moving average analytic: #{stock.symbol}, #{interval_type}, #{series_type}, #{time_period}"
        end
      end
    end
  end
end

