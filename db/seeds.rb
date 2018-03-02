# names = ['Top 10 Songs', 'Top Songs in the World', 'Worst Songs Ever', 'Good for Dance', 'Songs to Study to']

# @chart = 0 
# 5.times do 
#   Chart.create(name: names[@chart])
#   @chart += 1
# end 

@num = 1
5.times do 
  10.times do
    Song.create(title: Faker::Dessert.variety, chart_id: @num, artist_id: Faker::Number.between(1, 30))
  end
  @num += 1
end

30.times do
  Artist.create(name: Faker::RockBand.name)
end

