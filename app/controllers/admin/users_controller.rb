class Admin::UsersController < Admin::ApplicationController
  before_action :dont_delete_admin_user, only: [:destroy]

  def index
    @users = User.all
  end

  def destroy
    @user = User.find_by(id: params[:id])

    if @user.destroy
      redirect_to admin_users_path, notice: "User deleted."
    else
      redirect_to admin_users_path, alert: "User could not be deleted."
    end
  end

  private

  def dont_delete_admin_user
    @user = User.find_by(id: params[:id])

    if @user.admin?
      redirect_to admin_users_path, alert: "Cannot delete admin user."
    end
  end
end
