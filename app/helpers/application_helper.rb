# frozen_string_literal: true

module ApplicationHelper
  def company_name
    ENV.fetch("COMPANY_NAME", nil)
  end
end
