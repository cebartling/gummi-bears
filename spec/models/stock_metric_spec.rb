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
require 'rails_helper'

RSpec.describe StockMetric, type: :model do

  describe 'associations' do
    it { should belong_to(:metric).class_name('Metric') }
    it { should belong_to(:stock).class_name('Stock') }
  end

end
