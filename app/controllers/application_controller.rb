class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before any page loads, find the current_user
  before_action :find_current_user

  # add in method to use in the views

  helper_method :is_logged_in?

  def find_current_user

    if session[:user_id].present?
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end

  end

  # check login status
  def check_login
    unless is_logged_in?
      # all cool
      redirect_to new_session_path
    end
  end

  # is the person logeed in

  def is_logged_in?
    session[:user_id].present?
  end

end
