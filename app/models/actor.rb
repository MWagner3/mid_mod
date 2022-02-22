class Actor < ApplicationRecord
  has_many :movies, through: :movie_actors
  has_many :movie_actors
  validates :name, presence: true
  validates :age, presence: true
end
