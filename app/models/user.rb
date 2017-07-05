class User < ApplicationRecord

  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by(provider: auth['provider'], uid: auth['uid'])

    user.username = auth['info']['name']
    user.token = auth['credentials']['token']

    user.save
    user
  end

end
