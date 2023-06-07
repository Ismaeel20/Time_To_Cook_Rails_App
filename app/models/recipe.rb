class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_timers, dependent: :destroy
  validates :name, presence: true
end
