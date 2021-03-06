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
require 'rails_helper'

RSpec.describe Notification, type: :model do

  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
  end

end
