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
class UserStock < ApplicationRecord

  belongs_to :user
  belongs_to :stock

end
