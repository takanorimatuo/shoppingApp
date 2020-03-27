class UsersController < ApplicationController
  def index
    @products = Product.order("created_at DESC").limit(3)
    @category = Product.where(category_id: "1").limit(3)
  end
  
  def new
  end

end
