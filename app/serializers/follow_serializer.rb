class FollowSerializer < ActiveModel::Serializer
  attributes :id, :follower, :followed_user, :allow

  def follower
    user = User.find(@object.follower_id)
    user.slice(:id, :username)
  end

  def followed_user
    user = User.find(@object.followed_user_id)
    user.slice(:id, :username)
  end

end