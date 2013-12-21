class User < ActiveRecord::Base
	has_secure_password

	validates :first_name, :last_name, :email, :password, presence: true
	validates :password_confirmation, presence: true, on: :create
	validates :email, uniqueness: true

	def full_name
		"#{first_name} #{last_name}"
	end
end
