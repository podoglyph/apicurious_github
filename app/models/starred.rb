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

  def self.get_count(user)
    StarredRepoService.get_count(user)
  end

end
