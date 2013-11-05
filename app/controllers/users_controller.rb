class UsersController < ApplicationController

def create
  u = User.new

  u.first_name = params[:first_name]
  u.last_name = params[:last_name]
  u.email = params[:email]
  u.username = params[:username]
  u.password = params[:password]
  u.password_confirmation = params[:password_confirmation]

  if u.save
    session[:user_id] = u.id
    redirect_to games_url
  else
    redirect_to new_session_url
  end
end

def show
  @user = User.find_by_id(params[:id])
end
end
