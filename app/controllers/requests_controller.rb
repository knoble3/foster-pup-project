class RequestsController < ApplicationController
  before_action :set_request, only: [:edit, :update, :show]

  def new
    @dog = Dog.find(params[:dog_id])
    @request = Request.new
    authorize @request
  end

  def create
    @dog = Dog.find(params[:dog_id])
    @request = Request.new(request_params)
    @request.dog = @dog
    @request.user = current_user
    authorize @request
    if @request.save
      redirect_to dog_path(@dog)
    else
      raise
      render :new
    end
  end

  def show
    authorize @request
    @review = Review.new
  end

  def edit
    authorize @request
  end

  def update
    authorize @request
    @request.update(request_params)
    redirect_to dog_path(@dog)
  end

  private
  def request_params
    params.require(:request).permit(:content, :start_date, :end_date)
  end

  def set_request
    @request = Request.find(params[:id])
  end
end
