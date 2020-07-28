class FollowsController < ApplicationController

def create
  follow = Follow.create!(follow_params)
  render json: follow
end

def index
  users = User.all 
  render json: users.to_json(:only => [:id, :username, :created_at])
end

private

def follow_params
params.require(:follow).permit(:follower_id, :followed_user_id, :allow)
end

end