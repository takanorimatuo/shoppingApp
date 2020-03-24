class UsersController < ApplicationController
  def index
    @products = Product.includes(:user).order("created_at DESC").limit(3)
    @category = Product.includes(:user).where(category_id: "1").limit(3)
  end
  
  def new
  end

end
