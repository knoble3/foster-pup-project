class RequestsController < ApplicationController
  before_action :set_request, only: [:edit, :update]

  def new
    @request = Request.new
    authorize @request
  end

  def create
    @request = Request.new(request_params)
    authorize @request
    if @request.save
      redirect_to dog_path(@dog)
    else
      render :new
    end
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
