class FoulsController < ApplicationController

def index
    @fouls = Foul.all
  end

  def new

  end

  def create
    commit_player = Player.find_by_id(params[:commit_player]).id
    fouled_player = Player.find_by_id(params[:fouled_player]).id
    ref = Ref.find_by_id(params[:ref]).id
    foul = Foul.where("commit_player_id = ? AND fouled_player_id =? AND quarter = ? AND ref_id = ? AND game_id = ? AND name = ? AND time = ?", commit_player, fouled_player, params[:quarter], ref, params[:game_id], params[:foul].capitalize, params[:time]).first

    if foul.present?
      redirect_to foul_url(foul.id)
    else
    f = Foul.new
    f.commit_player_id = Player.find_by_id(params[:commit_player]).id
    f.fouled_player_id = Player.find_by_id(params[:fouled_player]).id
    f.quarter = params[:quarter]
    f.time = params[:time]
    f.ref_id = Ref.find_by_id(params[:ref]).id
    f.description = params[:description]
    f.game_id = params[:game_id]
    f.name = params[:foul]
    f.user_id = params[:user_id]
    f.save

    redirect_to game_url(params[:game_id])
    end
  end

  def edit

  end

  def update

  end

  def show
    @foul = Foul.find_by(id: params[:id])
    foul = Foul.find_by(id: params[:id])
    sum = foul.foul_upvote + foul.foul_downvote

    if foul.foul_upvote > foul.foul_downvote
      @percentage = "#{(foul.foul_upvote.to_f/sum) * 100.to_i}% Agree"
    elsif foul.foul_downvote > foul.foul_upvote
      @percentage = "#{(foul.foul_downvote.to_f/sum) * 100.to_i}% Disagree"
    else
      @percentage = "#{50}%"
    end

    if @percentage.include?('Agree')
      @percent_style = 'agree'
    elsif @percentage.include?('D')
      @percent_style = 'disagree'
    else
      @percent_style = 'tie'
    end
    @game = Game.find_by_id(1)
  end

  def detsoy

  end

  def contact

  end

  def foul_upvote
    foul = Foul.find_by_id(params[:foul_id])
    foul.foul_upvote += 1
    foul.save

    redirect_to foul_url(params[:foul_id])
  end

  def foul_downvote
    foul = Foul.find_by_id(params[:foul_id])
    foul.foul_downvote += 1
    foul.save

    redirect_to foul_url(params[:foul_id])
  end

end
