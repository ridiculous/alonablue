class HomeController < ApplicationController
  def index
    @current_page = :root
  end

  def catamaran
    @current_page = :catamaran
  end

  def gallery
    @current_page = :gallery
  end

  def location
    @current_page = :location
  end
end
