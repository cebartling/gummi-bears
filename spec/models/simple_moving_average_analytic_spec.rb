# == Schema Information
#
# Table name: simple_moving_average_analytics
#
# *id*::            <tt>uuid, not null, primary key</tt>
# *interval_type*:: <tt>integer, not null</tt>
# *series_type*::   <tt>integer, not null</tt>
# *time_period*::   <tt>integer, not null</tt>
# *created_at*::    <tt>datetime, not null</tt>
# *updated_at*::    <tt>datetime, not null</tt>
# *stock_id*::      <tt>uuid, not null</tt>
#
# Foreign Keys
#
#  fk_rails_...  (stock_id => stocks.id)
#--
# == Schema Information End
#++
require 'rails_helper'

RSpec.describe SimpleMovingAverageAnalytic, type: :model do

  describe 'associations' do
    it { should belong_to(:stock).class_name('Stock') }
    it { should have_many(:simple_moving_average_entries).class_name('SimpleMovingAverageEntry') }
  end

end
