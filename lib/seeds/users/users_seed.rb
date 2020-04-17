require 'csv'

module Seeds
  module Users
    class UsersSeed

      def self.execute
        puts 'START: Seeding users'
        csv_text = File.read(Rails.root.join('lib', 'seeds', 'users', 'users.csv'))
        csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
        csv.each do |row|
          found = User.find_by_username(row['username'])
          unless found
            new_user = User.create!({
                                      first_name: row['first_name'],
                                      last_name: row['last_name'],
                                      username: row['username']
                                    })
            puts "Created new user: #{new_user.username}"
          end
        end
        puts "There are now #{User.count} rows in the users table"
        puts 'FINISH: Seeding users'
      end
    end
  end
end