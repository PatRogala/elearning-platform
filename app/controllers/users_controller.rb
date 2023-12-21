class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      respond_to { |format| format.turbo_stream }
    else
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:fullname, :email, :avatar)
  end
end
