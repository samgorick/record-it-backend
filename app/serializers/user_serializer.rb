class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :created_at, :notes 

  has_many :notes
  has_many :given_follows
  has_many :received_follows

  def notes
    mine = @object.notes
    allowed = @object.given_follows.select { |f| f.allow }
    following = allowed.map{ |f| 
      user = User.find(f.followed_user_id)
      user.notes
    }
    result = mine + following
    result.flatten
  end
end