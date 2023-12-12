require "rails_helper"

RSpec.describe "Users" do
  subject(:user) { create(:user) }

  describe "unauthenticated user" do
    describe "GET /profile" do
      it "returns http redirect" do
        get profile_path
        expect(response).to have_http_status(:redirect)
      end
    end

    describe "GET /profile/edit" do
      it "returns http redirect" do
        get edit_profile_path
        expect(response).to have_http_status(:redirect)
      end
    end

    describe "PUT /profile" do
      it "returns http redirect" do
        put profile_path, params: { user: { fullname: "New Name" } }
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe "authenticated user" do
    before { sign_in user }

    describe "GET /profile" do
      it "returns http success" do
        get profile_path
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /profile/edit" do
      it "returns http success" do
        get edit_profile_path
        expect(response).to have_http_status(:success)
      end
    end

    describe "path /profile" do
      it "returns http redirect" do
        put profile_path, params: { user: { fullname: "New Name" } }
        expect(response).to have_http_status(:redirect)
      end

      it "updates the user" do
        put profile_path, params: { user: { fullname: "New Name" } }
        user.reload
        expect(user.fullname).to eq("New Name")
      end
    end
  end
end
