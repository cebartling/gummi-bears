# == Schema Information
#
# Table name: simple_moving_average_entries
#
# *id*::                                <tt>uuid, not null, primary key</tt>
# *event_timestamp*::                   <tt>datetime, not null</tt>
# *observation_value_in_cents*::        <tt>integer, not null</tt>
# *created_at*::                        <tt>datetime, not null</tt>
# *updated_at*::                        <tt>datetime, not null</tt>
# *simple_moving_average_analytic_id*:: <tt>uuid, not null</tt>
#
# Foreign Keys
#
#  fk_rails_...  (simple_moving_average_analytic_id => simple_moving_average_analytics.id)
#--
# == Schema Information End
#++
FactoryBot.define do
  factory :simple_moving_average_entry do
    
  end
end
