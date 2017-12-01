# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


30.times do |name| 
  name = Faker::RockBand.name 
  artist = Artist.create(name: name) 
  10.times do |title| 
    title = Faker::HowIMetYourMother.quote
    artist.songs.create(title: title )
  end
end

names = ['Top 10 Songs', 'Top Songs in the World', 'Worst Songs Ever', 'Good for Dance', 'Songs to Study to']

@chart = 0 
5.times do 
  Chart.create(name: names[@chart])
  @chart += 1
end 

@num = 1
5.times do 
  10.times do
    Song.create(title: Faker::Science.element, chart_id: @num)
  end
  @num += 1
end

@art = 0
50.times do
  @art += 1
  Artist.create(name: Faker::RockBand.name, song_id: @art)
end