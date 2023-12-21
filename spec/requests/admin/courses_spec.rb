require "rails_helper"

RSpec.describe "Admin::Courses" do
  describe "unauthenticated user" do
    describe "GET /admin/courses" do
      it "returns http redirect" do
        get admin_courses_path
        expect(response).to have_http_status(:redirect)
      end
    end

    describe "GET /admin/courses/new" do
      it "returns http redirect" do
        get new_admin_course_path
        expect(response).to have_http_status(:redirect)
      end
    end

    describe "POST /admin/courses" do
      it "returns http redirect" do
        post admin_courses_path
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe "authenticated user without admin role" do
    subject(:user) { create(:user) }

    before { sign_in user }

    describe "GET /admin/courses" do
      it "returns http redirect" do
        get admin_courses_path
        expect(response).to have_http_status(:redirect)
      end
    end

    describe "GET /admin/courses/new" do
      it "returns http redirect" do
        get new_admin_course_path
        expect(response).to have_http_status(:redirect)
      end
    end

    describe "POST /admin/courses" do
      it "returns http redirect" do
        post admin_courses_path
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe "authenticated user with admin role" do
    subject(:user) { create(:user, :admin) }

    before { sign_in user }

    describe "GET /admin/courses" do
      it "returns http success" do
        get admin_courses_path
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /admin/courses/new" do
      it "returns http success" do
        get new_admin_course_path
        expect(response).to have_http_status(:success)
      end
    end
  end
end
