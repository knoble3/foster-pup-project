class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @dogs = Dog.all
  end

  def dashboard
    # User info
    # User Dogs
    @dogs = current_user.dogs
    # User's Requests
    @requests = current_user.requests
    @pending_requests = @requests.where(status: "pending")
    @past_requests = @requests.where(status: "completed").or(@requests.where(status: "denied"))
    @accepted_requests = @requests.where(status: "accepted")
    # User's Reviews
    @reviews = Review.joins('JOIN requests r ON reviews.request_id = request.id').where(user: current_user)
  end
end
