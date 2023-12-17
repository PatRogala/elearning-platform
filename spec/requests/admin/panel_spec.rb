require "rails_helper"

RSpec.describe "Admin::Panels" do
  describe "unauthenticated user" do
    describe "GET /admin/users" do
      it "returns http redirect" do
        get admin_users_path
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe "authenticated user without admin role" do
    let(:user) { create(:user) }

    before { sign_in user }

    describe "GET /admin/users" do
      it "returns http redirect" do
        get admin_users_path
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe "authenticated user with admin role" do
    let(:user) { create(:user, :admin) }

    before { sign_in user }

    describe "GET /admin/users" do
      it "returns http success" do
        get admin_users_path
        expect(response).to have_http_status(:success)
      end
    end
  end
end
