class FollowsController < ApplicationController

def create
  follow = Follow.create!(follow_params)
  p follow 
  p "****************"
  render json: follow
end

def index
  follows = Follow.all
  render json: follows
end

private

def follow_params
params.require(:follow).permit(:follower_id, :followed_user_id, :allow)
end

end