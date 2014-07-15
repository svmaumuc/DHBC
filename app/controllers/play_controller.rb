class PlayController < ApplicationController
  before_action :checkLogin
  skip_before_filter :verify_authenticity_token

  def index
    #tạo câu hỏi mới
    @nextQuest = view_context.NewQues(@user)

    #kiem tra câu hỏi mới có ko
    if @nextQuest.nil?
      redirect_to :action => "end"
      return
    end

    #gán biến để xử lý hiện thị ở view
    @result = @nextQuest[0]
    @urlimg = @nextQuest[1]
    @listext = @nextQuest[2]
  end

  def check
    #load lại câu hỏi
    @nextQuest = view_context.NewQues(@user)

    #kiem tra câu hỏi có ko
    if @nextQuest.nil?
      redirect_to end_path
      return
    end

    #kiem tra cau hoi cu
    @check_answer = false
    if params['answer'] == @nextQuest[0]
      @check_answer  = true

      #lưu ket quả
      @newHis = Lichsu.new(cauhoi: @nextQuest[3], nguoichoi: @user,solantraloisai: 0, thoigian: 0)
      @newHis.save()
      @user.diem += 10
      @user.save()

      #tạo câu hỏi mới
      @nextQuest = view_context.NewQues(@user)

      #kiem tra câu hỏi mới có ko
      if @nextQuest.nil?
        redirect_to end_path
        return
      end
      #gán biến để xử lý hiện thị ở view
      @result = @nextQuest[0]; @urlimg = @nextQuest[1];  @listext = @nextQuest[2]
    end
  end

  def idea
    if params[:idea_picture].nil? or params[:idea_answer1].empty? or params[:idea_answer2].empty?
      @check_idea = false
      return
    end

    uploaded_io = params[:idea_picture]

    ch = Cauhoi.new(dapan: params[:idea_answer1],dapancodau: params[:idea_answer2])
    ch.save()

    hinh = Hinhanh.new(cauhoi: ch); hinh.save()
    hinh.link = '/uploads/' + hinh.id.to_s + '.jpg'
    hinh.save()

    name = hinh.id.to_s + '.jpg'
    File.open(Rails.root.join('public', 'uploads', name), 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end

  def end
  end

  def checkLogin
    # Hàm check login:
    # Nhiệm vụ kiểm tra xem hệ thống đăng nhập hay chưa, nếu chưa chuyển đến trang đăng nhập, ngược lại thì tiếp tục load
    if request.session[:user_id].nil?
      return redirect_to login_path
    else
      @user = Nguoichoi.find(request.session[:user_id])
    end
  end
end
