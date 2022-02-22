class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors
  validates :title, presence: true
  validates :creation_year, presence: true
  validates :genre, presence: true


  def avg_actor_age
      actors.average(:age).to_f
  end


end
