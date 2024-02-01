class Admin::UsersController < Admin::ApplicationController
  before_action :dont_delete_admin_user, only: [:destroy]

  def index
    @users = User.all
  end

  def destroy
    @user = User.find_by(id: params[:id])

    if @user.destroy
      redirect_to admin_users_path, notice: I18n.t("admin.users.destroy.success")
    else
      redirect_to admin_users_path, alert: I18n.t("admin.users.destroy.error")
    end
  end

  private

  def dont_delete_admin_user
    @user = User.find_by(id: params[:id])

    return unless @user.admin?

    redirect_to admin_users_path, alert: I18n.t("admin.users.destroy.admin")
  end
end
