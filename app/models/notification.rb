# == Schema Information
#
# Table name: notifications
#
# *id*::                     <tt>uuid, not null, primary key</tt>
# *message*::                <tt>text, not null</tt>
# *notification_timestamp*:: <tt>datetime, not null, indexed</tt>
# *read*::                   <tt>boolean, default(FALSE), not null</tt>
# *created_at*::             <tt>datetime, not null</tt>
# *updated_at*::             <tt>datetime, not null</tt>
# *user_id*::                <tt>uuid, not null</tt>
#
# Indexes
#
#  index_notifications_on_notification_timestamp  (notification_timestamp)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#--
# == Schema Information End
#++
class Notification < ApplicationRecord

  belongs_to :user

end
