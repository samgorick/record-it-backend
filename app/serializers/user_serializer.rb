class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :created_at, :notes 

  def notes
    mine = @object.notes
    following = @object.followings.map { |f| f.notes }
    result = mine + following
    result.flatten
  end

  has_many :notes
  has_many :followers
  has_many :followings
end