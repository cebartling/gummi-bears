require 'rails_helper'

RSpec.describe UserStock, type: :model do

  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should belong_to(:stock).class_name('Stock') }
  end

end
