module PasswordRecoverable
  extend ActiveSupport::Concern

  def send_password_recovery_instructions
    generate_password_recovery_token
    self.password_recovery_sent_at = Time.zone.now
    save!(validate: false)
    UserMailer.password_recovery_instructions(self).deliver
  end

  def password_recovery_expired?
    (password_recovery_sent_at + 24.hours).past?
  end

private

  def generate_password_recovery_token
    self.password_recovery_token = SecureRandom.hex(13).encode("utf-8")
  end
end