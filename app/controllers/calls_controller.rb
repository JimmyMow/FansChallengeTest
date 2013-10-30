class CallsController < ApplicationController

  def index
    @calls = Call.all
  end

  def new

  end

  def create
    c = Call.new
    c.description = params[:call]
    c.comment = params[:comment]
    c.save

    redirect_to calls_url
  end

  def edit

  end

  def update

  end

  def show
    @call = Call.find_by(id: params[:id])

  end

  def detsoy

  end

  def contact

  end

end
