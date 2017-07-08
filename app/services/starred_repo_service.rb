class StarredRepoService

  def initialize(user)
    @user = user
    @conn = Faraday.new(url: "https://api.github.com")
  end

  def find_repos
    raw_user_starred = conn.get "/user/starred?access_token=#{access_token}"

    JSON.parse(raw_user_starred.body, symbolize_names: true)
  end

  def get_count
    raw_stars = conn.get("/user/starred?access_token=#{access_token}")

    parsed_stars = JSON.parse(raw_stars.body, symbolize_names: true)

    parsed_stars.first[:stargazers_count]
  end

  def self.find_repos(user)
    new(user).find_repos
  end

  def self.get_count(user)
    new(user).get_count
  end

  private

    attr_reader :conn, :user

    def access_token
      user.token
    end

end
