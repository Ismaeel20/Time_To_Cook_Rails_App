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

  def time_in_minutes
    if time >= 60
      hours = (time/60).floor
      p hours
      remaining_time = time % 60
      p remaining_time
      "#{hours}:#{remaining_time.to_i.digits.size == 1 ? "0" : ""}#{remaining_time.to_i}:#{(60*(time - time.to_i)).to_i.digits.size == 1 ? "0" : ""}#{(60*(time - time.to_i)).to_i}"
    else
      "#{time.to_i}:#{(60*(time - time.to_i)).to_i}"
    end
  end
end
