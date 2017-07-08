class StarredController < ApplicationController

  def index
    @starred = Starred.find_repos(current_user)

    @star_count = Starred.get_count(current_user)

    raw_user_profile = Faraday.get("https://api.github.com/user?access_token=#{current_user.token}")
    @user_profile = JSON.parse(raw_user_profile.body, symbolize_names: true)
  end

end
