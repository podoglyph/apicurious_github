class FollowersController < ApplicationController

  def index
    raw_user_followers = Faraday.get("https://api.github.com/user/followers?access_token=#{current_user.token}")
    @user_followers = JSON.parse(raw_user_followers.body, symbolize_names: true)

    raw_user_profile = Faraday.get("https://api.github.com/user?access_token=#{current_user.token}")
    @user_profile = JSON.parse(raw_user_profile.body, symbolize_names: true)

    @star_count = Starred.get_count(current_user)
  end

end
