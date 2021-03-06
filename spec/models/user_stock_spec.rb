# == Schema Information
#
# Table name: user_stocks
#
# *id*::         <tt>uuid, not null, primary key</tt>
# *created_at*:: <tt>datetime, not null</tt>
# *updated_at*:: <tt>datetime, not null</tt>
# *stock_id*::   <tt>uuid, not null, indexed => [user_id]</tt>
# *user_id*::    <tt>uuid, not null, indexed => [stock_id]</tt>
#
# Indexes
#
#  user_id_stock_id_unique_idx  (user_id,stock_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (stock_id => stocks.id)
#  fk_rails_...  (user_id => users.id)
#--
# == Schema Information End
#++
require 'rails_helper'

RSpec.describe UserStock, type: :model do

  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should belong_to(:stock).class_name('Stock') }
    it { should have_many(:user_stock_transactions).class_name('UserStockTransaction') }
  end

  describe 'delegation' do
    it { should delegate_method(:company_name).to(:stock).as(:name) }
    it { should delegate_method(:stock_symbol).to(:stock).as(:symbol) }
  end
end
