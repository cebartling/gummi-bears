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
class SimpleMovingAverageAnalytic < ApplicationRecord
  enum interval_type: %i[1min 5min 15min 30min 60min daily weekly monthly]
  enum series_type: %i[close open high low]


  belongs_to :stock
  has_many :simple_moving_average_entries
end
