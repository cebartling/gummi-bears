# == Schema Information
#
# Table name: users
#
# *id*::           <tt>uuid, not null, primary key</tt>
# *display_name*:: <tt>string(255), default("No display name provided"), not null</tt>
# *username*::     <tt>string(255), indexed</tt>
# *created_at*::   <tt>datetime, not null</tt>
# *updated_at*::   <tt>datetime, not null</tt>
#
# Indexes
#
#  username_unique_idx  (username) UNIQUE
#--
# == Schema Information End
#++
class User < ApplicationRecord
  has_many :user_stocks, foreign_key: 'user_id', class_name: 'UserStock'
  has_many :user_stock_transactions, class_name: 'UserStockTransaction', through: :user_stocks
end
