class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :all_users
  def welcome
    if current_user
      index
      return
    end
    render '/static/login'
  end

  def index
    render '/static/index'
  end

  def require_current_user
    redirect_to root_path unless current_user
  end

  private

  def current_user
    @current_user ||= session[:current_user_id]&&
    User.find(session[:current_user_id])
  end

  def all_users
    @all_users = User.all
  end

end
