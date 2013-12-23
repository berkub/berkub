class PasswordsController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def new
  end

  def create
    user = User.where(email: params[:password][:email]).first
    user.send_password_recovery_instructions if user.present?

    redirect_to root_path, notice: t("passwords.create.notice")
  end

  def edit
  end

  def update
    ensure_recovery_token_valid

    if @user.update(user_params)
      redirect_to root_path, notice: t("passwords.update.notice")
    else
      render action: "edit"
    end
  end

private

  def user_params
    params.required(:user).permit(:password, :password_confirmation)
  end

  def set_user
    @user = User.where(password_recovery_token: params[:id]).first
  end

  def ensure_recovery_token_valid
    if @user.password_recovery_expired?
      redirect_to(new_password_path) && return
    end
  end
end