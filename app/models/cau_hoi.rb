class CauHoi < ActiveRecord::Base
  belongs_to :TheLoai
  belongs_to :HinhAnh
  has_many :LichSu
end
