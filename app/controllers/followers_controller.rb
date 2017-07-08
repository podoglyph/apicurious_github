class FollowersController < ApplicationController

  def index
    @user_followers = Follower.get_followers(current_user)
    @star_count = Starred.get_count(current_user)
  end

end
