# frozen_string_literal: true

module ApplicationHelper
  def company_name
    ENV['COMPANY_NAME']
  end
end
