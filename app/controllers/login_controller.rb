class LoginController < ApplicationController
  require 'openssl'
  require 'digest/md5'

  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

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

  def register

    newUser = Nguoichoi.new()
    newUser.provider = params[:email]
    newUser.matkhau = Digest::MD5.hexdigest(params[:password1])
    newUser.diem = 0
    newUser.save
    puts("alert('abc')")
    redirect_to root_path
  end

  def logging
    sessier.ten = params[:username]
    newUson[:user_id] = user.id
  end



end
