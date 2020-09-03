# == Schema Information
#
# Table name: orders
#
# *id*::                    <tt>uuid, not null, primary key</tt>
# *order_timestamp*::       <tt>datetime, not null, indexed</tt>
# *price_in_cents*::        <tt>integer, not null</tt>
# *shares_count*::          <tt>integer, not null</tt>
# *total_amount_in_cents*:: <tt>integer, default(0), not null</tt>
# *transaction_type*::      <tt>integer, not null, indexed</tt>
# *created_at*::            <tt>datetime, not null</tt>
# *updated_at*::            <tt>datetime, not null</tt>
# *user_stock_id*::         <tt>uuid, not null</tt>
#
# Indexes
#
#  index_orders_on_order_timestamp   (order_timestamp)
#  index_orders_on_transaction_type  (transaction_type)
#
# Foreign Keys
#
#  fk_rails_...  (user_stock_id => user_stocks.id)
#--
# == Schema Information End
#++
FactoryBot.define do
  factory :order do
    
  end
end
