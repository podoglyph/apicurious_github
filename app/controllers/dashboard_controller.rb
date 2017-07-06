class DashboardController < ApplicationController

  def index
    #View basic information about my account (profile pic{avatar_url}, number of starred repos(user_starred.first[:stargazers_count]), {followers}, {following})
    raw_user_profile = Faraday.get("https://api.github.com/user?access_token=#{current_user.token}")
    @user_profile = JSON.parse(raw_user_profile.body, symbolize_names: true)

    raw_stars = Faraday.get("https://api.github.com/user/starred?access_token=#{current_user.token}")
    parsed_stars = JSON.parse(raw_stars.body, symbolize_names: true)
    @num_stars = parsed_stars.first[:stargazers_count]
  end

end
