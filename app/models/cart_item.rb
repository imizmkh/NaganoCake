class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  def add_tax_price
    (price*1.1).floor
  end

  def subtotal_price
    product.add_tax_price*amount
  end

end
