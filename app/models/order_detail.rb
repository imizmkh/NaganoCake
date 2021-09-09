class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def subtotal_price
    product.add_tax_price*amount
  end
end
