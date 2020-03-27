class ProductsController < ApplicationController

  def index
    @products = Product.includes(:images).order('created_at DESC').limit(10)
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :text, :category_id, :brand, :status_id, :delivery_charge_id, :prefecture_id, :delivery_day_id, :price, images_attributes: [:src, :id])
  end
  
end
