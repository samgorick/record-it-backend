class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :tags, :updated_at

  belongs_to :user

  def tags
    @object.tags.map{ |tag| tag.name }
  end

  # def tags
  #   @object.tags.map{ |tag| TagSerializer.new(tag)}
  # end
end
