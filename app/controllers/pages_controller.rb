class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @dogs = Dog.all
    @user = current_user
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
    @incoming_requests = Request.joins(dog: :user).where(users: { id: current_user.id })
    # User's Reviews
    @reviews = Review.joins('JOIN requests r ON reviews.request_id = request.id').where(user: current_user)
  end
end
