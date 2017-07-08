class FollowingController < ApplicationController

  def index
    raw_user_following = Faraday.get("https://api.github.com/user/following?access_token=#{current_user.token}")
    @user_following = JSON.parse(raw_user_following.body, symbolize_names: true)

    raw_user_profile = Faraday.get("https://api.github.com/user?access_token=#{current_user.token}")
    @user_profile = JSON.parse(raw_user_profile.body, symbolize_names: true)

    @star_count = Starred.get_count(current_user)
  end

end
