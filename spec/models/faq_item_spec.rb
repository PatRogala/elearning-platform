require "rails_helper"

RSpec.describe FaqItem do
  describe "validations" do
    it { is_expected.to validate_presence_of(:question) }
    it { is_expected.to validate_presence_of(:answer) }
    it { is_expected.to validate_length_of(:question).is_at_most(255) }
    it { is_expected.to validate_length_of(:answer).is_at_most(1000) }

    it "is unique for question" do
      faq_item = create(:faq_item)
      expect(faq_item).to validate_uniqueness_of(:question)
    end
  end
end
