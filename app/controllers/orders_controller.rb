class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def info
    @cart_items = CartItem.all
    @customer = current_customer
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += cart_item.subtotal_price
    end
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:chose_address])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else params[:order][:select_address] == "2"
    end
  end

  def thanks
    @order = Order.find_by(id: params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_thanks_path
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
