class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_products, dependent: :destroy

  has_many :products, through: :order_products

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting: 0, paid: 1, producing: 2, preparing: 3, shipped: 4 }
  # enum postal_address: { customer_add: 0, register_add: 1, new_add: 2 }
end