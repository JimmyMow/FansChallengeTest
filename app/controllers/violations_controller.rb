class ViolationsController < ApplicationController

  def index
    @violations = Call.all
  end

  def new

  end

  def create
    player = Player.find_by_id(params[:player]).id
    ref = Ref.find_by_id(params[:ref]).id
    violation = Violation.where("player_id = ? AND quarter = ? AND ref_id = ? AND game_id = ? AND name = ? AND time = ?", player, params[:quarter], ref, params[:game_id], params[:violation], params[:time]).first

    if violation.present?
      redirect_to violation_url(violation.id)
    else
    v = Violation.new
    v.player_id = Player.find_by_id(params[:player]).id
    v.quarter = params[:quarter]
    v.time = params[:time]
    v.ref_id = Ref.find_by_id(params[:ref]).id
    v.description = params[:description]
    v.game_id = params[:game_id]
    v.name = params[:violation]
    v.user_id = params[:user_id]
    v.save

    redirect_to game_url(params[:game_id])
    end
  end

  def edit

  end

  def update

  end

  def show
    @violation = Violation.find_by(id: params[:id])
    violation = Violation.find_by(id: params[:id])
    sum = violation.violation_upvote + violation.violation_downvote

    if violation.violation_upvote > violation.violation_downvote
      @percentage = "#{(violation.violation_upvote.to_f/sum) * 100.to_i}% Agree"
    elsif violation.violation_downvote > violation.violation_upvote
      @percentage = "#{(violation.violation_downvote.to_f/sum) * 100.to_i}% Disagree"
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

  def violation_upvote
    violation = Violation.find_by_id(params[:violation_id])
    violation.violation_upvote += 1
    violation.save

    redirect_to violation_url(params[:violation_id])
  end

  def violation_downvote
    violation = Violation.find_by_id(params[:violation_id])
    violation.violation_downvote += 1
    violation.save

    redirect_to violation_url(params[:violation_id])
  end

end
