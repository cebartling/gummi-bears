# == Schema Information
#
# Table name: user_stocks
#
# *id*::         <tt>uuid, not null, primary key</tt>
# *created_at*:: <tt>datetime, not null</tt>
# *updated_at*:: <tt>datetime, not null</tt>
# *stock_id*::   <tt>uuid, not null</tt>
# *user_id*::    <tt>uuid, not null</tt>
#
# Foreign Keys
#
#  fk_rails_...  (stock_id => stocks.id)
#  fk_rails_...  (user_id => users.id)
#--
# == Schema Information End
#++
require 'rails_helper'

RSpec.describe UserStock, type: :model do

  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should belong_to(:stock).class_name('Stock') }
  end

end
