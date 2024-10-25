class Score < ApplicationRecord
  belongs_to :game
  validates :player, presence: true
  validates :points, numericality: { only_integer: true }
end
