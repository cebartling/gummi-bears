# == Schema Information
#
# Table name: stocks
#
# *id*::         <tt>uuid, not null, primary key</tt>
# *name*::       <tt>string(100), not null</tt>
# *symbol*::     <tt>string(10), not null, indexed</tt>
# *created_at*:: <tt>datetime, not null</tt>
# *updated_at*:: <tt>datetime, not null</tt>
#
# Indexes
#
#  symbol_unique_idx  (symbol) UNIQUE
#--
# == Schema Information End
#++
FactoryBot.define do
  factory :stock do
    name { "MyString" }
    symbol { "MyString" }
  end
end
