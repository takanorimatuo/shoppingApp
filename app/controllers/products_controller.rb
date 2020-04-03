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
      @product.update(seller_id: current_user.id)
      redirect_to root_path
    else
      @product.images.build
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    redirect_to root_path if @product.seller_id != current_user.id
    @images = @product.images.build
  end

  def update
    @product = Product.find(params[:id])
    if product.seller_id == current_user.id
      @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:product_name, :text, :category_id, :brand, :status_id, :delivery_charge_id, :prefecture_id, :delivery_day_id, :price, images_attributes: [:src, :_destroy, :id]).merge(seller_id: current_user.id)
  end
end
