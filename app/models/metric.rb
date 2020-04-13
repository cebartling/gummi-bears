# == Schema Information
#
# Table name: metrics
#
# *id*::         <tt>uuid, not null, primary key</tt>
# *name*::       <tt>string</tt>
# *created_at*:: <tt>datetime, not null</tt>
# *updated_at*:: <tt>datetime, not null</tt>
#--
# == Schema Information End
#++
class Metric < ApplicationRecord
end
