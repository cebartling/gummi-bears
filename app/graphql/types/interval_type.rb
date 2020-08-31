module Types
  class IntervalType < BaseEnum
    value 'oneMinute', 'One minute interval'
    value 'fiveMinute', 'Five minute interval'
    value 'fifteenMinute', 'Fifteen minute interval'
    value 'thirtyMinute', 'Thirty minute interval'
    value 'sixtyMinute', 'Sixty minute interval'
    value 'daily', 'Daily interval'
    value 'weekly', 'Weekly interval'
    value 'monthly', 'Monthly interval'
  end
end
