require "rails_helper"

RSpec.describe Admin::PanelHelper do
  describe "#panels" do
    it "returns an array of hashes" do
      expect(helper.panels).to be_an Array
      expect(helper.panels.first).to be_a Hash
    end

    it "returns a hash with a title and path" do
      expect(helper.panels.first).to have_key :title
      expect(helper.panels.first).to have_key :path
    end

    it "returns a hash with a title and path that are strings" do
      expect(helper.panels.first[:title]).to be_a String
      expect(helper.panels.first[:path]).to be_a String
    end
  end
end
