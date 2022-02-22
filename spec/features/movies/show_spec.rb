RSpec.describe 'movie show page' do

  it 'lists a movie with its attributes' do
    studio_1 = Studio.create(name: "Good Studio", location: 'Stafford')
    studio_2 = Studio.create(name: "OK Studio", location: 'Spotsylvania')
    movie_1 = studio_1.movies.create!(title: "Star Wars", creation_year: 1977, genre: "science_fiction")
    movie_2 = studio_2.movies.create!(title: "Star Trek", creation_year: 1966, genre: "science_fiction")


    visit "/movies/#{movie_1.id}"

    expect(page).to have_content(movie_1.title)
    expect(page).to have_content(movie_1.creation_year)
    expect(page).to have_content(movie_1.genre)
    expect(page).to_not have_content(movie_2.name)
  end

  it 'shows average age of movies actors' do
    studio_1 = Studio.create(name: "Good Studio", location: 'Stafford')
    movie_1 = studio_1.movies.create!(title: "Star Wars", creation_year: 1977, genre: "science_fiction")
    actor_1 = Actor.create(name: "John Doe", age: 50)
    actor_2 = Actor.create(name: "Jane Doe", age: 60)
    MovieActor.create(movie_id: movie_1.id, actor_id: actor_1.id)
    MovieActor.create(movie_id: movie_2.id, actor_id: actor_2.id)

    visit "/movies/#{movie_1.id}"

    expect(page).to have_content(movie_1.avg_actor_age)
  end

end
