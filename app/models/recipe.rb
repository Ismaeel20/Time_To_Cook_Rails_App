class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_timers
  validates :name, presence: true
end
