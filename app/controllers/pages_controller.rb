class PagesController < ApplicationController
  def home
    @dogs = Dog.all
  end

  def dashboard
  end
end
