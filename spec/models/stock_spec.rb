# == Schema Information
#
# Table name: stocks
#
# *id*::         <tt>uuid, not null, primary key</tt>
# *name*::       <tt>string(100), not null</tt>
# *symbol*::     <tt>string(10), not null, indexed</tt>
# *created_at*:: <tt>datetime, not null</tt>
# *updated_at*:: <tt>datetime, not null</tt>
#
# Indexes
#
#  symbol_unique_idx  (symbol) UNIQUE
#--
# == Schema Information End
#++
require 'rails_helper'

RSpec.describe Stock, type: :model do

  describe 'associations' do
    it { should have_many(:daily_time_series_events).class_name('DailyTimeSeriesEvent') }
    it { should have_many(:intraday_time_series_events).class_name('IntradayTimeSeriesEvent') }
    it { should have_many(:simple_moving_average_analytics).class_name('SimpleMovingAverageAnalytic') }
  end

end
