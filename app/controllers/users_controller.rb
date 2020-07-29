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

  def show
    token = request.headers['Authorization'].split(' ').last
    decoded_token = JWT.decode(token, 's3cret!', true, { algorithm: 'HS256' })
    id = decoded_token.first['user_id']

    user = User.find(id)
    if user
      render json: user
    else
      render json: { error: 'Invalid token'}
    end

  end

  def index
    users = User.all 
    render json: users
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end