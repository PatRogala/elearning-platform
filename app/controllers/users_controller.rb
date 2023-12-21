class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]
  before_action :validate_avatar, only: [:update]

  def show; end

  def edit
    render :edit
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path, notice: I18n.t('users.update.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:fullname, :email, :avatar)
  end

  def validate_avatar
    return unless params[:user][:avatar].present?

    @image_validator = ImageValidator.new(params[:user][:avatar], @user)
    render :edit unless @image_validator.valid?
  end
end
