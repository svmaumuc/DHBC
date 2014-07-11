class HomeController < ApplicationController
  before_action :checkLogin

  def index
  end

  def checkLogin
    # Hàm check login:
    # Nhiệm vụ kiểm tra xem hệ thống đăng nhập hay chưa, nếu chưa chuyển đến trang đăng nhập, ngược lại thì tiếp tục load
    if request.session[:user_id].nil?
      return redirect_to login_path
    end
  end
end
