class Rating < ApplicationRecord
  after_commit :calc_ratings
  belongs_to :movie
  belongs_to :user

  private

  def calc_ratings
    movie.update_column(
      :ratings_average,
      movie.ratings.average(:score).to_f.round(1)
    )
  end
end
