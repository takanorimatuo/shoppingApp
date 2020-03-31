class UsersController < ApplicationController
  def index
    @products = Product.order("created_at DESC").limit(3)
    @category = Product.order("rand()").limit(3)
  end
  
  def new
  end

end
