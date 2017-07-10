class DashboardController < ApplicationController

  def index
    @user_repos = Repo.repos(current_user)
    @star_count = Starred.get_count(current_user)
  end

end
