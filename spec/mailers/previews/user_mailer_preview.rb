class UserMailerPreview < ActionMailer::Preview
  def password_recovery_instructions
    UserMailer.password_recovery_instructions(User.last)
  end
end