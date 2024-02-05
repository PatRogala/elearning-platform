class PagesController < ApplicationController
  def show
    render template: "pages/#{params[:slug]}"
  end

  def faq
    @faq_items = FaqItem.all
    render template: "pages/faq"
  end
end
