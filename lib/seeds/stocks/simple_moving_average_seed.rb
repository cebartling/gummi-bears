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
            [5, 20, 10, 300].each do |time_period|
              create_analytic(found, time_period)
            end
          end
        end
        puts 'FINISH: Seeding simple moving average analytics'
      end

      private

      def self.create_analytic(stock, time_period)
        SimpleMovingAverageAnalytic.create!(
          stock: stock,
          interval_type: 'daily',
          series_type: 'close',
          time_period: time_period
        )
      end

    end
  end
end

