# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:fullname, :email, :password) }
  end

  def require_admin
    return if current_user&.admin?

    redirect_to root_path
  end

  def set_locale
    if cookies[:locale].nil?
      country_code = request.location.country_code
      locale = map_country_to_locale(country_code)
      cookies.permanent[:locale] = locale
    end
    I18n.locale = cookies[:locale] || I18n.default_locale
  end

  private

  def map_country_to_locale(country_code)
    case country_code
    when 'PL'
      :pl
    else
      :en
    end
  end
end
