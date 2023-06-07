class RecipeTimer < ApplicationRecord
  belongs_to :recipe

  validates :ingredient, :time, presence: true
  validates :time, numericality: { greater_than: 0 }
  # validates :recipe, presence: true
end
