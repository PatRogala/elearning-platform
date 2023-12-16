require "rails_helper"

RSpec.describe "Home" do
  describe "GET /" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /faq" do
    it "returns http success" do
      get "/faq"
      expect(response).to have_http_status(:success)
    end

    it "assigns @faq_items" do
      create(:faq_item)
      get "/faq"
      expect(assigns(:faq_items)).to eq(FaqItem.all)
    end
  end
end
