class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :tags, :updated_at, :username

  belongs_to :user

  def tags
    @object.tags.map{ |tag| tag.name }
  end

  def username
    @object.user.username
  end
end
