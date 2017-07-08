class FollowerService

  def initialize(user)
    @conn = Faraday.new("https://api.github.com")
    @user = user
  end

  def get_followers
    raw_user_followers = conn.get "/user/followers?access_token=#{access_token}"

    JSON.parse(raw_user_followers.body, symbolize_names: true)
  end

  def self.get_followers(user)
    new(user).get_followers
  end

  private

    attr_reader :user, :conn

    def access_token
      user.token
    end

end
