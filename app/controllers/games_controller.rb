class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def show
    @game = Game.find_by_id(params[:id])
    @home_team = Team.find_by_name(params[:home_team])
    @away_team = Team.find_by_name(params[:away_team])
  end

  def destroy

  end
end
