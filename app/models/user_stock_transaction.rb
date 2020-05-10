# == Schema Information
#
# Table name: user_stock_transactions
#
# *id*::                    <tt>uuid, not null, primary key</tt>
# *price_in_cents*::        <tt>integer, not null</tt>
# *shares_count*::          <tt>integer, not null</tt>
# *total_amount_in_cents*:: <tt>integer, default(0), not null</tt>
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
class UserStockTransaction < ApplicationRecord
  enum transaction_type: %i[buy sell]

  before_save :do_before_save

  belongs_to :user_stock

  delegate :company_name, to: :user_stock, allow_nil: false
  delegate :stock_symbol, to: :user_stock, allow_nil: false

  private

  def do_before_save
    self.total_amount_in_cents = price_in_cents * shares_count
  end

end
