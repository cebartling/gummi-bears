module Types
  class SeriesType < BaseEnum
    value 'close', 'Closing price series'
    value 'open', 'Opening price series'
    value 'high', 'Daily high price series'
    value 'low', 'Daily low price series'
  end
end
