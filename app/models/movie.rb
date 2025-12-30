class Movie < ApplicationRecord
  validates :name, presence: true 
  validates :release_date, presence: true
  validates :director, presence: true 
  validates :actor, presence: true 

end
