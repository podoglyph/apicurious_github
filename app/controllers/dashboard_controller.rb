class DashboardController < ApplicationController

  def index
    #generate list of pinned repositories
    raw_user_repos = Faraday.get("https://api.github.com/user/repos?access_token=#{current_user.token}")
    @user_repos = JSON.parse(raw_user_repos.body, symbolize_names: true)

    raw_user_profile = Faraday.get("https://api.github.com/user?access_token=#{current_user.token}")
    @user_profile = JSON.parse(raw_user_profile.body, symbolize_names: true)

    @star_count = Starred.get_count(current_user)
  end

end
