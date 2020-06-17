class Tag < ApplicationRecord
  has_many :notetags
  has_many :notes, through: :notetags
end