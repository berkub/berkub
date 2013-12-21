require "spec_helper"

describe UsersController do
	DatabaseCleaner.clean

	describe "GET #new" do
		before :each do
			get :new
		end

		it "responds successfully" do
			expect(response.status).to eql(200)
		end

		it "assigns @user" do
			expect(assigns(:user)).not_to be_nil
		end
	end

	describe "POST #create" do
		let(:user_attributes) { attributes_for(:user, first_name: "Irving")}

		before :each do
			post :create, user: user_attributes
		end

		it "creates a new user" do
			DatabaseCleaner.clean
			expect { post :create, user: user_attributes }.to change { User.count }.by(1)
		end

		it "redirects to root_path" do
			expect(request).to redirect_to(controller.url_after_signup)
		end
	end
end
