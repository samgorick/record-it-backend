class UsersController < ApplicationController

  def create
    user = User.find_by(username: user_params[:username])
    if user
      render json: { error: "This user has already signed up. Try logging in instead." }
    else
      user = User.create!(user_params)
      render json: user
    end
  end

  def login 
    user = User.find_by(username: user_params[:username])
    if user && user.authenticate(user_params[:password])
      render json: user
    else
      render json: { error: 'Invalid username or password'}
    end
  end

  def index
    users = User.all 
    render json: users.to_json(:only => [:id, :username, :created_at])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end