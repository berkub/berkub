require "spec_helper"

describe User do
  let(:thom) { build(:user, first_name: "Thom", last_name: "Yorke") }

  describe "#full_name" do
    it "constructs the full name based on first_ and last_name attributes" do
      expect(thom.full_name).to eql("Thom Yorke")
    end
  end

  describe "#send_password_recovery_instructions" do
    subject { thom.send_password_recovery_instructions }

    it "generates the recovery token" do
      expect { subject }.to change {thom.password_recovery_token}
    end

    it "updates the password_recovery_sent_at" do
      expect { subject }.to change { thom.password_recovery_sent_at }
    end

    it "sends the recovery instructions email" do
      expect { subject }. to change { ActionMailer::Base.deliveries.count}.by(1)
    end
  end

  describe "#password_recovery_expired?" do
    it "returns true if it's been more than 24 hours since the token has been generated" do
      expect(thom.password_recovery_expired?).to eql(false)
      thom.stubs(:password_recovery_sent_at).returns(2.years.ago)
      expect(thom.password_recovery_expired?).to eql(true)
    end
  end
end
