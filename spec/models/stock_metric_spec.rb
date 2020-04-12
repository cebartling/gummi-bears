require 'rails_helper'

RSpec.describe StockMetric, type: :model do

  describe 'associations' do
    it { should belong_to(:metric).class_name('Metric') }
    it { should belong_to(:stock).class_name('Stock') }
  end

end
