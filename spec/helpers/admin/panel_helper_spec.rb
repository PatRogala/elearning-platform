require "rails_helper"

RSpec.describe Admin::PanelHelper do
  describe "#panels" do
    it "returns an array" do
      expect(helper.panels).to be_an Array
    end

    it "returns an array of hashes" do
      expect(helper.panels.first).to be_a Hash
    end

    it "returns a hash with a title" do
      expect(helper.panels.first).to have_key :title
    end

    it "returns a hash with a path" do
      expect(helper.panels.first).to have_key :path
    end

    it "returns a hash with a title that is string" do
      expect(helper.panels.first[:title]).to be_a String
    end

    it "returns a hash with a path that is string" do
      expect(helper.panels.first[:path]).to be_a String
    end
  end
end
