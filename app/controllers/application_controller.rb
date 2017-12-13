class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def not_found
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end

  helper_method :current_user
end
