class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update]

  def index
    @dogs = Dog.all
    query = params["dog-search"]
    if query && query != ""
      @dogs = Dog.where("lower(name) LIKE '%#{query.downcase}%'")
    end
  end

  def show
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
   if @dog.save
      redirect_to dog_path(@dog)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @dog.update(dog_params)
    redirect_to dog_path(@dog)
  end

  def destroy
    @dog.destroy
    redirect_to root_path
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :description, :photo)
  end
end
