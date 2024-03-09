class PagesController < ApplicationController
  def show
    valid_slugs = %w[home faq cookie-policy]
    if valid_slugs.include?(params[:slug])
      render template: "pages/#{params[:slug]}"
    else
      render file: "#{Rails.root}/public/404.html", status: :not_found
    end
  end

  def faq
    @faq_items = FaqItem.all
    render template: "pages/faq"
  end
end
