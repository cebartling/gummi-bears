# == Schema Information
#
# Table name: user_stock_transactions
#
# *id*::                    <tt>uuid, not null, primary key</tt>
# *price_in_cents*::        <tt>integer, not null</tt>
# *shares_count*::          <tt>integer, not null</tt>
# *transaction_timestamp*:: <tt>datetime, not null, indexed</tt>
# *transaction_type*::      <tt>integer, not null, indexed</tt>
# *created_at*::            <tt>datetime, not null</tt>
# *updated_at*::            <tt>datetime, not null</tt>
# *user_stock_id*::         <tt>uuid, not null</tt>
#
# Indexes
#
#  index_user_stock_transactions_on_transaction_timestamp  (transaction_timestamp)
#  index_user_stock_transactions_on_transaction_type       (transaction_type)
#
# Foreign Keys
#
#  fk_rails_...  (user_stock_id => user_stocks.id)
#--
# == Schema Information End
#++
require 'rails_helper'

RSpec.describe UserStockTransaction, type: :model do

  it do
    should define_enum_for(:transaction_type)
  end

  describe 'associations' do
    it { should belong_to(:user_stock).class_name('UserStock') }
  end

  describe 'delegation' do
    it { should delegate_method(:company_name).to(:user_stock) }
    it { should delegate_method(:stock_symbol).to(:user_stock) }
  end
end
