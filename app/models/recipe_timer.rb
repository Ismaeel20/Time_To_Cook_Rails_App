class RecipeTimer < ApplicationRecord
  belongs_to :recipe

  validates :ingredient, :time, presence: true
  validates :time, numericality: { greater_than: 0 }
  # validates :recipe, presence: true

  def time_in_minutes
    if time.to_f >= 60
      hours = (time / 60).floor
      remaining_time = time % 60
      "#{hours}:#{remaining_time.to_i.digits.size == 1 ? "0" : ""}#{remaining_time.to_i}:#{(60*(time - time.to_i)).to_i.digits.size == 1 ? "0" : ""}#{(60*(time - time.to_i)).to_i}"
    else
      "#{time.to_i}:#{(60*(time - time.to_i)).to_i}"
    end
  end
end
