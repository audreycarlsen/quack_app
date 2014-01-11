class QuacksController < ApplicationController
  def index
    @quack = Quack.new
    @quacks = Quack.all
  end

  def show
    @quack = Quack.find(params[:id])
  end

  def create
    @quack = Quack.new(params.require(:quack).permit(:author, :body))
    if @quack.save
      redirect_to quacks_path
    else
      render :index
    end
  end
end
