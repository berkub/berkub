class User < ActiveRecord::Base
  include PasswordRecoverable

  has_secure_password

  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end
end