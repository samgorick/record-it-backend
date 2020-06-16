class UsersController < ApplicationController

  def create
    p params
    user = User.find_or_create_by(username: params[:username])
    render json: user
  end

  def index
    users = User.all 
    render json: users
  end

end