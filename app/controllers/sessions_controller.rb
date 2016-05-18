class SessionsController < ApplicationController
  def create
    if request.env["omniauth.auth"]
      user = User.find_or_create_by_auth(request.env["omniauth.auth"])
      user.roles << Role.find_by(name: "session_guest")
    else
      user = User.create_guest
      user.roles << Role.find_by(name: "session_guest")
    end
    if user
      session[:user_id] = user.id
      if params[:survey_flag]
        redirect_to survey_path(1)
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    current_user.answers.delete_all
    session.clear
    redirect_to root_path
  end
end
