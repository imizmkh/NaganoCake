class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total_price = 0
    @order_details.each do |order_detail|
      @total_price += order_detail.subtotal_price
    end
  end
end
