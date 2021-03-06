class FollowsController < ApplicationController

def create
  follow = Follow.create!(follow_params)
  render json: follow
end

def index
  follows = Follow.all
  render json: follows
end

def update
  follow = Follow.find(follow_params[:id])
  follow.update!(allow: true)
  render json: follow
end

def destroy
  follow = Follow.find(params[:id])
  follow.delete
end

private

def follow_params
params.require(:follow).permit(:id, :follower_id, :followed_user_id, :allow)
end

end