class FollowingController < ApplicationController

  def index
    @user_following = Following.get_following(current_user)
    @star_count = Starred.get_count(current_user)
  end

end
