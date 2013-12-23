require "spec_helper"

describe PasswordsController do
  let(:alex) { create(:user, first_name: "Alex") }

  describe "POST #create" do
    subject { post :create, password: { email: alex.email } }

    it "sends password recovery instructions" do
      expect { subject }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    it "redirects to root_url" do
      expect(subject).to redirect_to(root_path)
    end
  end

  describe "PATCH #update" do
    before :each do
      # alex.stubs(:password_recovery_expired?).returns(true)
      # User.expects(:first).returns(alex)
      # patch :update, user: { password: "secret", password_confirmation: "secret" }, id: alex.password_recovery_token
    end

    it "redirects to new_password_path when recovery token has expired" do
      pending "200 instead of redirect"
      expect(response).to redirect_to(new_password_path)
    end
  end
end
