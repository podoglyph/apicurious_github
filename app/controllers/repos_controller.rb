class ReposController < ApplicationController

  def index
    raw_user_repos = Faraday.get("https://api.github.com/user/repos?access_token=#{current_user.token}")
    @user_repos = JSON.parse(raw_user_repos.body, symbolize_names: true)

    raw_user_profile = Faraday.get("https://api.github.com/user?access_token=#{current_user.token}")
    @user_profile = JSON.parse(raw_user_profile.body, symbolize_names: true)
  end

end
