module Types
  class IntervalType < BaseEnum
    value '1min', 'One minute interval'
    value '5min', 'Five minute interval'
    value '15min', 'Fifteen minute interval'
    value '30min', 'Thirty minute interval'
    value '60min', 'Sixty minute interval'
    value 'daily', 'Daily interval'
    value 'weekly', 'Weekly interval'
    value 'monthly', 'Monthly interval'
  end
end
