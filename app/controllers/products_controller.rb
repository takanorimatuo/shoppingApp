class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @products = Product.includes(:images).order('created_at DESC').limit(10)
  end

  def new
    @product = Product.new
    @images = @product.images.build
  end

  def create
    @product = Product.new(product_params)
    @product.valid?
    if @product.images.present? && @product.save
      redirect_to root_path
    else
      @product.images.build
      render "new"
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

    params.require(:product).permit(:product_name, :text, :category_id, :brand, :status_id, :delivery_charge_id, :prefecture_id, :delivery_day_id, :price, images_attributes: [:src, :id]).merge(seller_id: current_user.id)

  end
end
