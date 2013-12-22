class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save!
			login_as(@user) && redirect_to(url_after_signup, notice: t("users.create.notice"))
		else
			render action: "new"
		end
	end

private

	def user_params
		params.required(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
end
