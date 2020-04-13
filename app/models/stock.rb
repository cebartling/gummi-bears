# == Schema Information
#
# Table name: stocks
#
# *id*::         <tt>uuid, not null, primary key</tt>
# *name*::       <tt>string(100), not null</tt>
# *symbol*::     <tt>string(10), not null</tt>
# *created_at*:: <tt>datetime, not null</tt>
# *updated_at*:: <tt>datetime, not null</tt>
#--
# == Schema Information End
#++
class Stock < ApplicationRecord
end
