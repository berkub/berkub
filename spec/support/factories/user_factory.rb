FactoryGirl.define do
	factory :user do
		first_name "John"
		last_name "Smith"
		sequence(:email) { |n| "#{first_name}.#{last_name}.#{n}@example.com".downcase }
		password "secret"
		password_confirmation { password }
		password_recovery_token "secret_token"
		password_recovery_sent_at Time.zone.now
	end
end