class FollowingController < ApplicationController

  def index
    raw_user_following = Faraday.get("https://api.github.com/user/following?access_token=#{current_user.token}")
    @user_following = JSON.parse(raw_user_following.body, symbolize_names: true)

    raw_user_profile = Faraday.get("https://api.github.com/user?access_token=#{current_user.token}")
    @user_profile = JSON.parse(raw_user_profile.body, symbolize_names: true)

    raw_stars = Faraday.get("https://api.github.com/user/starred?access_token=#{current_user.token}")
    parsed_stars = JSON.parse(raw_stars.body, symbolize_names: true)
    @star_count = parsed_stars.first[:stargazers_count]
  end

end
