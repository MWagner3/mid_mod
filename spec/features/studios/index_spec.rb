require 'rails_helper'

RSpec.describe 'studio index' do

  it 'lists all the studios with their attributes and movie titles' do
    studio_1 = Studio.create(name: "Good Studio", location: 'Stafford')
    studio_2 = Studio.create(name: "OK Studio", location: 'Spotsylvania')
    studio_3 = Studio.create(name: "Bad Studio", location: 'Fairfax')
    studios = [studio_1, studio_2, studio_3]
    movie_1 = studio_1.movies.create!(title: "Star Wars", creation_year: 1977, genre: "science_fiction")
    movie_2 = studio_2.movies.create!(title: "Star Trek", creation_year: 1966, genre: "science_fiction")
    movie_3 = studio_3.movies.create!(title: "Star People", creation_year: 1955, genre: "science_fiction")

    visit "/studios"

    studios.each do |studio|
      expect(page).to have_content(studio.name)
      expect(page).to have_content(studio.location)
      # expect(page).to have_content(studio.movie_titles)
    end
    expect(page).to have_content(movie_1.title)
    expect(page).to have_content(movie_2.title)
    expect(page).to have_content(movie_3.title)
  end


end
