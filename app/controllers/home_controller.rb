class HomeController < ApplicationController
  def index
  end

  def play
    @listext = ['A','B','C','B','E','O','H','I','N','E'];
    @urlimg = "/assets/1.jpg"
    @result = "BIENBAO"
  end

  def check
    @listext = ['O','B','A','B','G','O','G','H','N','U'];
    @urlimg = "/assets/nguao.jpg"
    @result = "NGUAO"
  end
end
