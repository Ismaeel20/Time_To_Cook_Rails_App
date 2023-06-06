class Timer < ApplicationRecord
  # belongs_to :user

  validates :ingredient, :time, presence: true
  validates :time, numericality: { greater_than: 0 }

end
