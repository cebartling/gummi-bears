# == Schema Information
#
# Table name: stock_metrics
#
# *id*::         <tt>uuid, not null, primary key</tt>
# *created_at*:: <tt>datetime, not null</tt>
# *updated_at*:: <tt>datetime, not null</tt>
# *metric_id*::  <tt>uuid, not null</tt>
# *stock_id*::   <tt>uuid, not null</tt>
#
# Foreign Keys
#
#  fk_rails_...  (metric_id => metrics.id)
#  fk_rails_...  (stock_id => stocks.id)
#--
# == Schema Information End
#++
FactoryBot.define do
  factory :stock_metric do
    
  end
end
