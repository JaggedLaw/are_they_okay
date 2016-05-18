class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize!

  helper_method :current_user, :blog_service

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authorize!
    unless authorized?
      flash[:alert] = "Nothing to view"
      redirect_to root_path
    end
  end

  private

    def authorized?
      current_permission.allow?
    end

    def current_permission
      @current_permission ||= Permission.new(current_user, params[:controller], params[:action])
    end
end
