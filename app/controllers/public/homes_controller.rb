class Public::HomesController < ApplicationController
  def top
    @products = Product.order(created_at: :desc).limit(4)
    # @products = Product.all
  end
end
