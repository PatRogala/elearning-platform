# frozen_string_literal: true

require "rails_helper"

RSpec.describe User do
  subject(:user) { build(:user) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:fullname) }
  end

  describe "#initials" do
    it "return empty string if fullname is nil" do
      user.fullname = nil

      expect(user.initials).to eq('')
    end

    it "return initials in uppercase if fullname is present" do
      user.fullname = "John Doe"

      expect(user.initials).to eq('JD')
    end

    it "should handle fullname with one word" do
      user.fullname = "John"

      expect(user.initials).to eq('J')
    end
  end
end
