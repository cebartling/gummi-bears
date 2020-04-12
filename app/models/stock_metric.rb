class StockMetric < ApplicationRecord
  belongs_to :stock
  belongs_to :metric
end
