# == Schema Information
#
# Table name: simple_moving_average_entries
#
# *id*::                                <tt>uuid, not null, primary key</tt>
# *event_timestamp*::                   <tt>datetime, not null</tt>
# *observation_value*::                 <tt>decimal(, ), not null</tt>
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
require 'rails_helper'

RSpec.describe SimpleMovingAverageEntry, type: :model do

  describe 'associations' do
    it { should belong_to(:simple_moving_average_analytic).class_name('SimpleMovingAverageAnalytic') }
  end

end
