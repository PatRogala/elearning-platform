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

    describe "POST /admin/courses" do
      context "with valid params" do
        let(:course_params) { attributes_for(:course) }

        it "returns http success" do
          post admin_courses_path, params: { course: course_params, format: :turbo_stream }
          expect(response).to have_http_status(:success)
        end

        it "creates a new course" do
          expect do
            post admin_courses_path, params: { course: course_params, format: :turbo_stream }
          end.to change(Course, :count).by(1)
        end
      end

      context "with invalid params" do
        let(:course_params) { attributes_for(:course, :invalid) }

        it "returns http success" do
          post admin_courses_path, params: { course: course_params }
          expect(response).to render_template(:new)
        end
      end
    end
  end
end
