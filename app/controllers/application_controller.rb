class ApplicationController < ActionController::Base
  require 'lockup'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :check_for_lockup
  
  protect_from_forgery with: :exception
  
  helper_method :current_user
  
  helper_method :logged_in?

  
  protected
  # Returns the currently logged in user or nil if there isn't one
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def authenticate
    logged_in? ? true : access_denied
  end

  
  def logged_in?
    current_user.is_a? User
  end


  def access_denied
    redirect_to login_path, :notice => "Please log in to continue" and return false
  end
  
end
