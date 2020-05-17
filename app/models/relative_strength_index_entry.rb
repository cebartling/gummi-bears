# == Schema Information
#
# Table name: relative_strength_index_entries
#
# *id*::                                  <tt>uuid, not null, primary key</tt>
# *event_timestamp*::                     <tt>datetime, not null</tt>
# *index_value*::                         <tt>decimal(, ), not null</tt>
# *created_at*::                          <tt>datetime, not null</tt>
# *updated_at*::                          <tt>datetime, not null</tt>
# *relative_strength_index_analytic_id*:: <tt>uuid, not null</tt>
#
# Foreign Keys
#
#  fk_rails_...  (relative_strength_index_analytic_id => relative_strength_index_analytics.id)
#--
# == Schema Information End
#++
class RelativeStrengthIndexEntry < ApplicationRecord
  belongs_to :relative_strength_index_analytic
end
