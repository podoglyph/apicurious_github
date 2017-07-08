class Starred
  attr_reader :repo_name

  def initialize(repo)
    @repo_name = repo[:name]
  end

  def self.find_repos(user)
    StarredRepoService.find_repos(user).map do |repo|
      new(repo)
    end
  end

end
