class GithubService

  def initialize(user)
    @username = user.username
    @token = user.token
    @conn = Faraday.new(url: "https://api.github.com")
  end

  def repos
    raw_user_repos = conn.get "/user/repos?access_token=#{token}"
    JSON.parse(raw_user_repos.body, symbolize_names: true)
  end

  def self.repos(user)
    new(user).repos
  end

  private

    attr_reader :username, :token, :conn

end
