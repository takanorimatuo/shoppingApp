class BuyController < ApplicationController

  before_action :set_product

  def new
    @address = Address.find_by(user_id: current_user.id)
    Payjp.api_key =  Rails.application.credentials[:payjp][:secret_key]
      if current_user.cards.present?
        customer_id = current_user.cards.first.customer_id
        customer = Payjp::Customer.retrieve(customer_id)
        card_id = customer.default_card
        @card = customer.cards.retrieve(card_id)
      end
    @credit = Card.find_by(user_id: current_user.id)
  end

  def create
    @card = Card.find_by(user_id: current_user.id)
    Payjp.api_key=  Rails.application.credentials[:payjp][:secret_key]
    charge = Payjp::Charge.create(
      amount: @product.price,
      customer: @card.customer_id,
      currency: 'jpy'
    )
    @product.update(buyer_id: current_user.id)
    redirect_to root_path
  end


  private
    def set_product
      @product = Product.find(params[:product_id])
    end

    def product_params
     params.require(:product).permit(:product_name, :delivery_charge_id, :prefecture_id, :delivery_day_id, :price, images_attributes: [:src, :id]).merge(buyer_id: current_user.id)
    end

end
