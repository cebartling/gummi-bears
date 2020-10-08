require 'csv'

module Seeds
  module Notifications
    class NotificationsSeed

      def self.execute
        puts 'START: Seeding notifications'
        csv_text = File.read(Rails.root.join('lib', 'seeds', 'notifications', 'notifications.csv'))
        User.all.each do |user|
          csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
          csv.each do |row|
            new_notification = Notification.create!({
                                                      message: row['message'],
                                                      read: false,
                                                      notification_timestamp: DateTime.now,
                                                      user: user
                                                    })
            puts "Created new notification: #{new_notification.id}"
          end
        end
        puts "There are now #{Notification.count} rows in the notifications table"
        puts 'FINISH: Seeding notifications'
      end
    end
  end
end
