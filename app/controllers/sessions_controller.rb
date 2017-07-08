class SessionsController < ApplicationController

  def create
    user = User.find_or_create_by_omniauth(request.env['omniauth.auth'])
    if user
      session[:user_id] = user.id
      redirect_to dashboard_index_path
    else
      redirect_to root_path
    end
  end

  def delete
    session.destroy
    redirect_to root_path
  end

end
