class UserMailer < ActionMailer::Base
  default from: "Berkub <do-not-reply@berkub.com>"

  def password_recovery_instructions(user)
    @user = user
    mail to: @user.email
  end
end
