module Authenticatable
	extend ActiveSupport::Concern

	included do
	end

	def url_after_signup
		root_path
	end
end