class StarredRepoService

  def initialize(user)
    @user = user
    @conn = Faraday.new(url: "https://api.github.com")
  end

  def find_repos
    raw_user_starred = conn.get "/user/starred?access_token=#{user.token}"

    @user_starred = JSON.parse(raw_user_starred.body, symbolize_names: true)
  end

  def self.find_repos(user)
    new(user).find_repos
  end

  private

    attr_reader :conn, :user

end
