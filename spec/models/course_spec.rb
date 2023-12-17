require 'rails_helper'

RSpec.describe Course, type: :model do
  subject(:course) { create(:course) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }

    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
