class FollowerSerializer < ActiveModel::Serializer
  attributes :id, :follower_id, :followed_user_id, :allow

  belongs_to :user
end