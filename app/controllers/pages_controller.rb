class PagesController < ApplicationController
  def home
  end

  def dashboard
    # User info
    # User Dogs
    @dogs = current_user.dogs
    # User's Requests
    @requests = current_user.requests
    # User's Reviews
    @reviews = Review.joins('JOIN requests r ON reviews.request_id = request.id').where(user: current_user)
  end
end
