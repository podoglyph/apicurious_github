class User < ApplicationRecord
  validates_presence_of :username, :token, :uid
  validates_uniqueness_of :username, :token, :uid

  def self.find_or_create_by_omniauth(auth)
    user = User.find_or_create_by(provider: auth['provider'], uid: auth['uid'])

    user.username = auth['info']['nickname']
    user.token = auth['credentials']['token']
    user.save
    user
  end

end
