# == Schema Information
#
# Table name: users
#
# *id*::         <tt>uuid, not null, primary key</tt>
# *auth_token*:: <tt>string(255), indexed</tt>
# *first_name*:: <tt>string(40), not null</tt>
# *last_name*::  <tt>string(50), not null</tt>
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
FactoryBot.define do
  factory :user do
    first_name { "MyString" }
    last_name { "MyString" }
    username { "MyString" }
  end
end
