class StarredController < ApplicationController

  def index
    @starred = Starred.find_repos(current_user)

    @star_count = Starred.get_count(current_user)

  end

end
