class ItemsController < ApplicationController

  def index
    @products = Product.all.page(params[:page]).per(8)
  end

  def show
    @product = Product.find(params[:id])
  end


end
