require 'csv'

module Seeds
  module UserStocks
    class UserStocksSeed

      def self.execute
        puts 'START: Seeding user_stocks'
        csv_text = File.read(Rails.root.join('lib', 'seeds', 'user_stocks', 'user_stocks.csv'))
        csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
        csv.each do |row|
          found_user = User.find_by_username(row['username'])
          found_stock = Stock.find_by_symbol(row['symbol'])
          if found_stock and found_user
            found = UserStock.find_by({user: found_user, stock: found_stock})
            if found.nil?
              new_user_stock = UserStock.create!({stock: found_stock, user: found_user})
              puts "Created new user/stock association: #{new_user_stock.id})"
            end
          end
        end
        puts "There are now #{UserStock.count} rows in the user_stocks table"
        puts 'FINISH: Seeding user_stocks'
      end
    end
  end
end