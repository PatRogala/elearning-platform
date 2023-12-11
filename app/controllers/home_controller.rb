class HomeController < ApplicationController
  def index; end

  def faq
    @faq_items = FaqItem.all
  end
end
