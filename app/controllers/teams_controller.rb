class TeamsController < ApplicationController

def index
  @teams = Team.all
end

def show
  @team = Team.find_by_id(params[:id])
end

def edit

end

def update

end

end
