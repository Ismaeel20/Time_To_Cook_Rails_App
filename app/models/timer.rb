class Timer < ApplicationRecord
  include PgSearch::Model
  # belongs_to :user

  validates :ingredient, :time, presence: true
  validates :time, numericality: { greater_than: 0 }

  pg_search_scope :search_by_ingredient_and_time,
  against: [ :ingredient, :time ],
  using: {
    tsearch: { prefix: true }
  }
end
