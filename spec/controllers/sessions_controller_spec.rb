require "spec_helper"

describe SessionsController do
  describe "GET #new" do
    before :each do
      get :new
    end

    it "responds successfully" do
      expect(response.status).to eql(200)
    end
  end

  describe "POST #create" do
    let(:dave) { create(:user, first_name: "Dave", password: "secret")}

    before :each do
      post :create, session: { email: dave.email, password: "secret"}
    end

    it "logs the user in" do
      expect(session[:user_id]).to eql(dave.id)
    end
  end
end