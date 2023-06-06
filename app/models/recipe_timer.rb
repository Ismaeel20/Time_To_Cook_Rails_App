class RecipeTimer < ApplicationRecord
  belongs_to :recipe, dependent: :destroy

  validates :ingredient, :duration, presence: true
  validates :duration, numericality: { only_integer: true, greater_than: 0 }
  validates :recipe, presence: true
end
