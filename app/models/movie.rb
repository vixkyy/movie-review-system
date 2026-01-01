class Movie < ApplicationRecord
  scope :filter_days, -> (date) {
    where(release_date: date)
  }
  scope :search, -> (title){
    where(name: title)
  }
  validates :name, presence: true
  validates :release_date, presence: true
  validates :director, presence: true
  validates :actor, presence: true

  has_one_attached :image
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
end
