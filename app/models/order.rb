class Order < ApplicationRecord


  belongs_to :customer
  has_many :order_products, dependent: :destroy

  has_many :products, through: :order_products


  enum payment_method: { credit_card: 0, transfer: 1 }
end