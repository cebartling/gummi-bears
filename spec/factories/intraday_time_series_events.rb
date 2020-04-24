# == Schema Information
#
# Table name: intraday_time_series_events
#
# *id*::             <tt>uuid, not null, primary key</tt>
# *close_price*::    <tt>decimal(, ), not null</tt>
# *event_datetime*:: <tt>datetime, not null</tt>
# *high_price*::     <tt>decimal(, ), not null</tt>
# *low_price*::      <tt>decimal(, ), not null</tt>
# *open_price*::     <tt>decimal(, ), not null</tt>
# *volume*::         <tt>integer, not null</tt>
# *created_at*::     <tt>datetime, not null</tt>
# *updated_at*::     <tt>datetime, not null</tt>
# *stock_id*::       <tt>uuid, not null</tt>
#
# Foreign Keys
#
#  fk_rails_...  (stock_id => stocks.id)
#--
# == Schema Information End
#++
FactoryBot.define do
  factory :intraday_time_series_event do
    
  end
end
