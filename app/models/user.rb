class User < ApplicationRecord
  validates_presence_of :username, :token, :uid
  validates_uniqueness_of :username, :token, :uid

  def self.find_or_create_by_omniauth(auth)
    user = User.find_or_create_by(provider: auth['provider'], uid: auth['uid'])

    user.username = auth['info']['nickname']
    user.token = auth['credentials']['token']
    user.image_url = auth['info']['image']
    user.num_public_repos = auth['extra']['raw_info']['public_repos']
    user.num_followers = auth['extra']['raw_info']['followers']
    user.num_following = auth['extra']['raw_info']['following']
    user.save
    user
  end

end
