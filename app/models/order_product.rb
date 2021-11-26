class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  
  enum product_status: { impossible: 0, waiting: 1, producing: 2, finish: 3 }
end