require 'csv'

module Seeds
  module UserStocks
    class UserStocksSeed

      def self.execute
        puts 'START: Seeding user_stocks'
        csv_text = File.read(Rails.root.join('lib', 'seeds', 'stocks', 'stocks.csv'))
        csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
        csv.each do |row|
          found_user = User.find_by_username(row['username'])
          found_stock = Stock.find_by_symbol(row['symbol'])
          if found_stock and found_user
            found = UserStock.find_by({user: found_user, stock: found_stock})
            unless found and found.count > 0
              new_user_stock = UserStock.create!({stock: found_stock, user: found_user})
              puts "Created new user/stock association: #{new_user_stock.id})"
            end
          end
        end
        puts "There are now #{Stock.count} rows in the stocks table"
        puts 'FINISH: Seeding user_stocks'
      end
    end
  end
end