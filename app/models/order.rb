class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }
end

  def add_tax_price
    (price*1.1).floor
  end

  def subtotal_price
    product.add_tax_price*amount
  end
