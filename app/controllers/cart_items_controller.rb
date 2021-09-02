class CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    @customer = current_customer
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += cart_item.subtotal_price
    end
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @customer = current_customer
    if cart_item = current_customer.cart_items.find_by(product_id: params[:cart_item][:product_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to cart_items_path
    else @cart_item.save
      redirect_to cart_items_path
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(update_cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :product_id)
  end

  def update_cart_item_params
    params.require(:cart_item).permit(:amount)
  end

end
