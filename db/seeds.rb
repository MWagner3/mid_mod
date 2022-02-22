# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

studio_1 = Studio.create(name: "Good Studio", location: 'Stafford')
studio_2 = Studio.create(name: "OK Studio", location: 'Spotsylvania')
studio_3 = Studio.create(name: "Bad Studio", location: 'Fairfax')

movie_1 = studio_1.movies.create!(title: "Star Wars", creation_year: 1977, genre: "science_fiction")
movie_2 = studio_2.movies.create!(title: "Star Trek", creation_year: 1966, genre: "science_fiction")
movie_3 = studio_3.movies.create!(title: "Star People", creation_year: 1955, genre: "science_fiction")
