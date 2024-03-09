class PagesController < ApplicationController
  def show
    valid_slugs = %w[home faq cookie-policy]
    if valid_slugs.include?(params[:slug])
      render template: "pages/#{params[:slug]}"
    else
      render file: Rails.public_path.join("404.html").to_s, status: :not_found
    end
  end

  def faq
    @faq_items = FaqItem.all
    render template: "pages/faq"
  end
end
