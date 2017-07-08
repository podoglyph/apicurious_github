class RepoService

  def initialize(user)
    @user = user
    @conn = Faraday.new(url: "https://api.github.com")
  end

  def get_repos
    raw_user_repos = conn.get "/user/repos?access_token=#{access_token}"
    JSON.parse(raw_user_repos.body, symbolize_names: true)
  end

  def self.get_repos(user)
    new(user).get_repos
  end

  private

    attr_reader :user, :conn

    def access_token
      user.token
    end
end
