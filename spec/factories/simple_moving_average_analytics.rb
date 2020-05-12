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
FactoryBot.define do
  factory :simple_moving_average_analytic do
    
  end
end
