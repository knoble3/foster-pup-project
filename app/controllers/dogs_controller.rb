class DogsController < ApplicationController
  def index
    @dogs = Dog.all
    query = params["dog-search"]
      if query && query != ""
        @dogs = Dog.where("lower(name) LIKE '%#{query.downcase}%'")
      end
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
  end


end
