class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }


  def add_tax_price
    (price*1.1).floor
  end

  def subtotal_price
    product.add_tax_price*amount
  end

  def total_price
    total_price = 0
    self.order_details.each do |order_detail|
      total_price += order_detail.subtotal_price
    end
    total_price += 800
    return total_price
  end
  
end
