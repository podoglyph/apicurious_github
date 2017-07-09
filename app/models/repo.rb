class Repo
  attr_reader :name, :language, :pushed, :url, :description

  def initialize(repo)
    @name = repo[:name]
    @language = repo[:language]
    @pushed = repo[:pushed_at]
    @url = repo[:url]
    @description = repo[:description]
  end

  def self.get_repos(user)
    RepoService.get_repos(user).map do |raw_repo|
      new(raw_repo)
    end
  end

end
