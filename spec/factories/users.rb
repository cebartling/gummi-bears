# == Schema Information
#
# Table name: users
#
# *id*::         <tt>uuid, not null, primary key</tt>
# *username*::   <tt>string(255), indexed</tt>
# *created_at*:: <tt>datetime, not null</tt>
# *updated_at*:: <tt>datetime, not null</tt>
#
# Indexes
#
#  username_unique_idx  (username) UNIQUE
#--
# == Schema Information End
#++
FactoryBot.define do
  factory :user do
    first_name { "MyString" }
    last_name { "MyString" }
    username { "MyString" }
  end
end
