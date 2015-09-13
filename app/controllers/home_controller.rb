class HomeController < ApplicationController
  def index
    @current_page = :root
  end

  def catamaran
    @current_page = :catamaran
    @page_title = 'Catamaran'
  end

  def gallery
    @current_page = :gallery
    @page_title = 'Photo Gallery'
  end

  def location
    @current_page = :location
    @page_title = 'Location'
  end
end
