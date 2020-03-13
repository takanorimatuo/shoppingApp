class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :new_user_params, if: :devise_controller?
  protect_from_forgery with: :exception
  
  def create
    User.create(new_user_params)
  end

  private
  
  def production?
    Rails.env.production?
  end

  
  def new_user_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_kana, :last_kana, :nickname, :birth_day])
  end


  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
