class Nguoichoi < ActiveRecord::Base
  has_many :lichsus

  def self.omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.ten = auth.info.name
      user.namsinh = auth.extra.raw_info.birthday
      user.linkfb = 'http://facebook.com/' + auth.uid
      user.image = auth.info.image
      user.token = auth.credentials.token
      user.expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
