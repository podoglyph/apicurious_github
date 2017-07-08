class FollowingService

  def initialize(user)
    @conn = Faraday.new("https://api.github.com")
    @user = user
  end

  def get_following
    raw_user_following = conn.get "/user/following?access_token=#{access_token}"

    JSON.parse(raw_user_following.body, symbolize_names: true)
  end

  def self.get_following(user)
    new(user).get_following
  end

  private

    attr_reader :user, :conn

    def access_token
      user.token
    end

end
