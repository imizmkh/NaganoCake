class ItemsController < ApplicationController

  def index
    @products = Product.order(created_at: :desc).limit(8)
  end

  def show
  end
end
