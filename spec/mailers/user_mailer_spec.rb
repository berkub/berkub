require "spec_helper"

describe UserMailer do
  describe "#password_recovery_instructions" do
    let(:michael) { create(:user, first_name: "Michael", password_recovery_token: "supertoken") }
    subject { UserMailer.password_recovery_instructions(michael).deliver }

    it "sends the password recovery instructions" do
      expect { subject }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    context "email" do
      let(:steve) { create(:user, first_name: "Steve", password_recovery_token: "supertoken") }
      subject { ActionMailer::Base.deliveries.last }

      before :each do
        UserMailer.password_recovery_instructions(steve).deliver
      end

      it "is sent to the given user's address" do
        expect(subject.to).to include(steve.email)
      end

      it "contains the password_recovery_token" do
        expect(subject.body).to match /supertoken/
      end
    end
  end
end