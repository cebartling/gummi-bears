# == Schema Information
#
# Table name: intraday_time_series_events
#
# *id*::             <tt>uuid, not null, primary key</tt>
# *close_price*::    <tt>decimal(, ), not null</tt>
# *event_datetime*:: <tt>datetime, not null, indexed => [stock_id]</tt>
# *high_price*::     <tt>decimal(, ), not null</tt>
# *low_price*::      <tt>decimal(, ), not null</tt>
# *open_price*::     <tt>decimal(, ), not null</tt>
# *volume*::         <tt>integer, not null</tt>
# *created_at*::     <tt>datetime, not null</tt>
# *updated_at*::     <tt>datetime, not null</tt>
# *stock_id*::       <tt>uuid, not null, indexed => [event_datetime]</tt>
#
# Indexes
#
#  stock_id_and_event_datetime_unique_idx  (stock_id,event_datetime) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (stock_id => stocks.id)
#--
# == Schema Information End
#++
require 'rails_helper'

RSpec.describe IntradayTimeSeriesEvent, type: :model do

  describe 'associations' do
    it { should belong_to(:stock).class_name('Stock') }
  end

  describe 'validations' do
    subject { FactoryBot.create(:intraday_time_series_event) }
    it { should validate_uniqueness_of(:event_datetime).scoped_to(:stock_id) }
  end

end
