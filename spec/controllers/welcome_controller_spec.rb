require 'spec_helper'

describe WelcomeController do
	describe "GET #index" do
		before :each do
			get :index
		end
		
		it "responds successfully" do
			expect(response.status).to eql(200)
		end
	end
end
