class HomesController < ApplicationController
  def top
    @products = Product.order(created_at: :desc).limit(4)
  end
end
