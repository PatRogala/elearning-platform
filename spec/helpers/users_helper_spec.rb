require "rails_helper"

RSpec.describe UsersHelper do
  describe "#avatar_or_default_for" do
    it "returns avatar if user has avatar attached" do
      user = create(:user, :with_avatar)

      expect(helper.avatar_or_default_for(user)).to match(/<img/)
    end

    it "returns avatar placeholder if user has no avatar attached" do
      user = build(:user, fullname: "John Doe")

      expect(helper.avatar_or_default_for(user)).to match(/JD/)
    end
  end
end
