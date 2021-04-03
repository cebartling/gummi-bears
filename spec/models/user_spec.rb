# == Schema Information
#
# Table name: users
#
# *id*::         <tt>uuid, not null, primary key</tt>
# *auth_token*:: <tt>string(255), indexed</tt>
# *username*::   <tt>string(255), indexed</tt>
# *created_at*:: <tt>datetime, not null</tt>
# *updated_at*:: <tt>datetime, not null</tt>
#
# Indexes
#
#  auth_token_unique_idx  (auth_token) UNIQUE
#  username_unique_idx    (username) UNIQUE
#--
# == Schema Information End
#++
require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'associations' do
    it { should have_many(:user_stocks).with_foreign_key('user_id').class_name('UserStock') }
    it { should have_many(:user_stock_transactions).through(:user_stocks).class_name('UserStockTransaction') }
  end
end
