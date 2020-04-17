require 'csv'

module Seeds
  module Stocks
    class StocksSeed

      def self.execute
        puts 'START: Seeding stocks'
        csv_text = File.read(Rails.root.join('lib', 'seeds', 'stocks', 'stocks.csv'))
        csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
        csv.each do |row|
          found = Stock.find_by_symbol(row['symbol'])
          unless found
            new_stock = Stock.create!({
                                        symbol: row['symbol'],
                                        name: row['name']
                                      })
            puts "Created new stock: #{new_stock.name} (#{new_stock.symbol})"
          end
        end
        puts "There are now #{Stock.count} rows in the stocks table"
        puts 'FINISH: Seeding stocks'
      end
    end
  end
end