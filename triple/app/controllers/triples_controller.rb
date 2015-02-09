class TriplesController < ApplicationController
  def index
  	@numbers = Number.all
  end

  def new
  end

  def calc
  	@number = Number.create(number_params) 
    @number.calculate
  end

  def status
  	@number = Number.find(params[:number_id])
  	render json: {id: @number.id, calculated: @number.calculated}
  end
  
  def show
  	@number = Number.find(params[:id])
  end

  private
  def number_params
    params.require(:number).permit(:value)
  end
end
