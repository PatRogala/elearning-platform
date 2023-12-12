# frozen_string_literal: true

require "rails_helper"

RSpec.describe User do
  subject(:user) { build(:user) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:fullname) }
  end
end
