module Authenticatable
	extend ActiveSupport::Concern
	
	included do
	end
	
	def url_after_registration
		root_path
	end
end