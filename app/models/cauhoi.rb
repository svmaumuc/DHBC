class Cauhoi < ActiveRecord::Base
  has_many :hinhanhs
  has_many :lichsus
  belongs_to :theloai
end