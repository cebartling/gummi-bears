# == Schema Information
#
# Table name: user_stock_transactions
#
# *id*::                    <tt>uuid, not null, primary key</tt>
# *price_in_cents*::        <tt>integer, not null</tt>
# *shares_count*::          <tt>integer, not null</tt>
# *transaction_timestamp*:: <tt>datetime, not null</tt>
# *created_at*::            <tt>datetime, not null</tt>
# *updated_at*::            <tt>datetime, not null</tt>
# *user_stock_id*::         <tt>uuid, not null</tt>
#
# Foreign Keys
#
#  fk_rails_...  (user_stock_id => user_stocks.id)
#--
# == Schema Information End
#++
class UserStockTransaction < ApplicationRecord
  enum transaction_type: {buy: 'buy', sell: 'sell'}, _prefix: :transaction_type
end
