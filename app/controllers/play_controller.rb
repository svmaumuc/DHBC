class PlayController < ApplicationController
  before_action :checkLogin
  skip_before_filter :verify_authenticity_token

  def index
    #tạo câu hỏi mới
    @nextQuest = NewQues(@user)

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
    @nextQuest = NewQues(@user)

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
      @nextQuest = NewQues(@user)

      #kiem tra câu hỏi mới có ko
      if @nextQuest.nil?
        redirect_to end_path
        return
      end
      #gán biến để xử lý hiện thị ở view
      @result = @nextQuest[0]
      @urlimg = @nextQuest[1]
      @listext = @nextQuest[2]
    end
  end

  def idea
    uploaded_io = params[:idea_picture]

    ch = Cauhoi.new()
    ch.dapan = params[:idea_answer1]
    ch.dapancodau = params[:idea_answer2]
    ch.save()

    hinh = Hinhanh.new()
    hinh.cauhoi = ch
    hinh.save()
    hinh.link = '/uploads/' + hinh.id.to_s + '.jpg'
    hinh.save()

    name = hinh.id.to_s + '.jpg'
    File.open(Rails.root.join('public', 'uploads', name), 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end

  def end
  end

  def NewQues(user) #=> [dapan, linkhinh, chuoiRandom, record cauhoi]
    @user = Nguoichoi.find(user.id)

    #lấy ds cau hoi đã trả lời của nguoi choi
    @ansArr = []
    @hisArr = @user.lichsus
    @hisArr.each do |his|
      @ansArr << his.cauhoi
    end

    #lấy ds cau hoi chưa trả lời
    @quesArr = Cauhoi.all -  @ansArr

    if @quesArr.empty?
      return
    end

    #chọn câu hỏi chưa trả lời
    @ques = @quesArr.first

    # Gán đáp án và link hình vào biến
    @result = '' + (@ques.dapan)
    @urlimg = '' + @ques.hinhanhs.first.link

    #random chuỗi chứa từ để chọn trả lời
    @charA_Z = ['A','B','C','D','E','G','H','I','K','L','M','N','O','P','Q','R','T','V','X','Y','U','S']
    @listext = ''+@ques.dapan
    (10-@ques.dapan.length).times do
      @listext.insert(Random.rand(@listext.length), @charA_Z[Random.rand(22)])
    end

    return @result,@urlimg,@listext,@ques
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
