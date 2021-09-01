class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  def add_tax_price
    (self.price*1.08).round
  end

  def subtotal_price
    product.price*1.08*amount
  end

end
