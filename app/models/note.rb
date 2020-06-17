class Note < ApplicationRecord
  belongs_to :user
  has_many :notetags
  has_many :tags, through: :notetags
end
