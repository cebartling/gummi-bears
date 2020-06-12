# == Schema Information
#
# Table name: stocks
#
# *id*::                     <tt>uuid, not null, primary key</tt>
# *current_price_in_cents*:: <tt>integer</tt>
# *latest_trading_date*::    <tt>date</tt>
# *name*::                   <tt>string(100), not null</tt>
# *percent_change*::         <tt>decimal(12, 4)</tt>
# *price_change_in_cents*::  <tt>integer</tt>
# *symbol*::                 <tt>string(10), not null, indexed</tt>
# *volume*::                 <tt>integer</tt>
# *created_at*::             <tt>datetime, not null</tt>
# *updated_at*::             <tt>datetime, not null</tt>
#
# Indexes
#
#  symbol_unique_idx  (symbol) UNIQUE
#--
# == Schema Information End
#++
class Stock < ApplicationRecord

  has_many :daily_time_series_events, -> { order(event_date: :desc) }
  has_many :intraday_time_series_events, -> { order(event_datetime: :desc) }
  has_many :simple_moving_average_analytics
  has_many :relative_strength_index_analytics
end
