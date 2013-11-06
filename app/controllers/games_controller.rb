class GamesController < ApplicationController
  def index
    @games = Game.all
    @number_of_challenges = current_user.violations.count + current_user.fouls.count
  end

  def new
    @teams = Team.all
    @refs = Ref.all
  end

  def create
    g = Game.new
    g.away_team_id = params[:away_team]
    g.home_team_id = params[:home_team]

    g.save

    GameRef.create(game_id: g.id, ref_id: params[:ref_one])
    GameRef.create(game_id: g.id, ref_id: params[:ref_two])
    GameRef.create(game_id: g.id, ref_id: params[:ref_three])

    redirect_to games_url
  end

  def edit

  end

  def update

  end

  def show
    @game = Game.find_by_id(params[:id])
  end

  def destroy

  end
end
