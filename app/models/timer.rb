class Timer < ApplicationRecord
  # belongs_to :user

  validates :ingredient, :duration, presence: true
  validates :duration, numericality: { only_integer: true, greater_than: 0 }

end
