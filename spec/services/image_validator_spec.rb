require "rails_helper"

RSpec.describe "ImageValidator" do
  subject(:image_validator) { ImageValidator.new(image, user) }

  let(:user) { create(:user) }
  let(:image) { Rack::Test::UploadedFile.new("spec/fixtures/files/avatar.png", "image/png") }

  describe "#valid?" do
    context "when image is valid" do
      it "returns true" do
        expect(image_validator.valid?).to be_truthy
      end
    end

    context "when image is not valid" do
      let(:image) { Rack::Test::UploadedFile.new("spec/fixtures/files/invalid.txt", "text/plain") }

      it "returns false" do
        expect(image_validator.valid?).to be_falsey
      end
    end
  end
end
