module ApplicationHelper

  def is_logged_in
    return session[:user_id] != nil
  end

  def get_current_user
    return User.find(session[:user_id])
  end
end
