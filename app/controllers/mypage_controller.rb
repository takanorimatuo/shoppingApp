class MypageController < ApplicationController
  def index
    user = User.find(params[:id])
    @nicknmae = user.nickname
  end
end
