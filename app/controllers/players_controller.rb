class PlayersController < ApplicationController

def index
  @players = Player.all
end

def show
  @player = Player.find_by_id(params[:id])
end

def new

end

def edit

end

def update

end

def destroy

end

end
