class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :created_at, :notes 

  has_many :notes
  has_many :given_follows
  has_many :received_follows

  def notes
    mine = @object.notes
    following = @object.followings.map { |f| f.notes }
    result = mine + following
    result.flatten
  end
end