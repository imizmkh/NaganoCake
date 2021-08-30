class CustomersController < ApplicationController
  before_action :set_cart_item, only: [:add_item, :destroy]
  before_action :set_user


  def show
    @customer = current_customer
    @cart_items = @customer.cart_items
  end

  def add_item
    @cart_item = @customer.cart_items.build(product_id: params[:product_id]) if @cart_item.blank?
    @cart_item.amount += params[:amount].to_i
    if @cart_item.save
      redirect_to current_customer
    else
      redirect_to controller: "products", action: "show"
    end
  end

  def destroy
    @customer.destroy
    redirect_to curent_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_my_page_path
  end

  def quit
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end


  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end

  def set_customer
    @customer =current_customer
  end
  
  def set_cart_item
    @cart_item = current_customer.cart_items.find_by(product_id: params[:product_id])
  end


end
