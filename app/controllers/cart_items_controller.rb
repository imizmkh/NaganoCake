class CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    @customer = current_customer
    
  end

  def create
    @customer = current_customer
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :product_id)
  end
end
