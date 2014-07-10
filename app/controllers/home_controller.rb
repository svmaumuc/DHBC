class HomeController < ApplicationController
  before_action :checkLogin

  def index
  end

  def play
    #tạo câu hỏi mới
    @nextQuest = NewQues(@user)

    #gán biến để xử lý hiện thị ở view
    @result = @nextQuest[0]
    @urlimg = @nextQuest[1]
    @listext = @nextQuest[2]
  end

  def check
    #load lại câu hỏi
    @nextQuest = NewQues(@user)

    #kiem tra cau hoi cu
    @check_answer = false
    if params['answer'] == @nextQuest[0]
      @check_answer  = true

      #lưu ket quả
      @newHis = Lichsu.new(cauhoi: @nextQuest[3], nguoichoi: @user,solantraloisai: 0, thoigian:0)
      @newHis.save()
      @user.diem += 10
      @user.save()

      #tạo câu hỏi mới
      @nextQuest = NewQues(@user)

      #gán biến để xử lý hiện thị ở view
      @result = @nextQuest[0]
      @urlimg = @nextQuest[1]
      @listext = @nextQuest[2]
    end
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

    #chọn câu hỏi chưa trả lời
    @ques = @quesArr.first

    # Gán đáp án và link hình vào biến
    @result = '' + (@ques.dapan)
    @urlimg = @ques.hinhanhs.first.link

    #random chuỗi chứa từ để chọn trả lời
    @charA_Z = ['A','B','C','D','E','G','H','I','K','L','M','N','O','P','Q','R','T','V','X','Y','U','S']
    @listext = ''+@ques.dapan
    (10-@ques.dapan.length).times do
      @listext.insert(Random.rand(@listext.length), @charA_Z[Random.rand(22)])
    end

    return @result,@urlimg,@listext,@ques
  end

  def checkLogin
    @user = Nguoichoi.find(1)
  end
end
