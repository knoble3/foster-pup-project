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
    @completed_requests = @requests.where('status = ? AND end_date < ?', "accepted", Date.today)
    @completed_requests.each do |request|
      request.update(status: "completed")
    end
    @past_requests = @requests.where(status: "completed").or(@requests.where(status: "rejected"))
    @upcoming_requests = @requests.where('status = ? AND start_date > ? AND  end_date > ?', "accepted", Date.today, Date.today)
    @current_fosters = @requests.where('status = ? AND start_date < ? AND end_date > ?', "accepted", Date.today, Date.today)
    @incoming_requests = Request.joins(dog: :user).where(users: { id: current_user.id })
    # User's Reviews
    @reviews = Review.joins('JOIN requests r ON reviews.request_id = request.id').where(user: current_user)

  end
end
