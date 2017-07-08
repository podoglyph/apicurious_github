module FeatureHelpers
  def logged_in_as_user
    user = create(:user)
    page.set_rack_session(user_id: user.id)
    user
  end
end
