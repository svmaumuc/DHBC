class LoginController < ApplicationController
  def index
  end

  def create
    user = Nguoichoi.omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  # Nếu người dùng login Facebook nhấn Cancel thì sẽ quay lại trang chủ
  def omniauth_failure
    redirect_to root_path
    #redirect wherever you want.
  end

end
