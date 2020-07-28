class User < ApplicationRecord
  has_secure_password
  has_many :notes

  # returns an array of follows for a user
  has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow"

  # returns an array of users who follow a user
  has_many :followers, through: :received_follows, source: :follower

  # returns an array of follows a user gave to someone else
  has_many :given_follows, foreign_key: :follower_id, class_name: "Follow"

  # returns an array of other users who the user has followed
  has_many :followings, through: :given_follows, source: :followed_user

end
