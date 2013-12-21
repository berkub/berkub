require "spec_helper"

describe User do
  let(:thom) { build(:user, first_name: "Thom", last_name: "Yorke") }
  
  describe "#full_name" do
    it "constructs the full name based on first_ and last_name attributes" do
      expect(thom.full_name).to eql("Thom Yorke")
    end
  end
end
