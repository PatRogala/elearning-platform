class Admin::PanelController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index; end
end
