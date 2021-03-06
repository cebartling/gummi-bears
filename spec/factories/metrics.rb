# == Schema Information
#
# Table name: metrics
#
# *id*::         <tt>uuid, not null, primary key</tt>
# *name*::       <tt>string, indexed</tt>
# *created_at*:: <tt>datetime, not null</tt>
# *updated_at*:: <tt>datetime, not null</tt>
#
# Indexes
#
#  name_unique_idx  (name) UNIQUE
#--
# == Schema Information End
#++
FactoryBot.define do
  factory :metric do
    name { "MyString" }
  end
end
