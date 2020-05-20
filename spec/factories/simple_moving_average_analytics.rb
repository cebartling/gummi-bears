# == Schema Information
#
# Table name: simple_moving_average_analytics
#
# *id*::            <tt>uuid, not null, primary key</tt>
# *data*::          <tt>jsonb</tt>
# *interval_type*:: <tt>integer, not null, indexed => [stock_id, series_type, time_period]</tt>
# *series_type*::   <tt>integer, not null, indexed => [stock_id, interval_type, time_period]</tt>
# *time_period*::   <tt>integer, not null, indexed => [stock_id, interval_type, series_type]</tt>
# *created_at*::    <tt>datetime, not null</tt>
# *updated_at*::    <tt>datetime, not null</tt>
# *stock_id*::      <tt>uuid, not null, indexed => [interval_type, series_type, time_period]</tt>
#
# Indexes
#
#  simple_moving_average_analytics_unique_idx  (stock_id,interval_type,series_type,time_period)
#
# Foreign Keys
#
#  fk_rails_...  (stock_id => stocks.id)
#--
# == Schema Information End
#++
FactoryBot.define do
  factory :simple_moving_average_analytic do
    
  end
end
