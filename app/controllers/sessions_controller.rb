class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(email: params[:session][:email]).first
    if user && user.authenticate(params[:session][:password])
      login_as(user) && redirect_to(url_after_login, notice: t("sessions.create.notice"))
    else
      flash.now.alert = t("sessions.create.invalid")
      render action: "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to url_after_logout, notice: t("sessions.destroy.notice")
  end

private

  def session_params
    params.required(:session).permit(:email, :password)
  end
end
