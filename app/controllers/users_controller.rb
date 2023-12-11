class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit]

  def show
  end

  def edit
  end

  private

  def set_user
    @user = current_user
  end
end
