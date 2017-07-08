class ReposController < ApplicationController

  def index
    @user_repos = Repo.get_repos(current_user)
    @star_count = Starred.get_count(current_user)
  end

end
