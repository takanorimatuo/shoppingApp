class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.create(address_params)
      if @address.save
        redirect_to root_path
      else
        render :new
      end
  end

private
  def address_params
    params.require(:address).permit(:address_number, :prefecture_id, :city, :address, :building, :tel).merge(user_id: current_user.id)
  end

end
