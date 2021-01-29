require_relative "car.rb"

intro = Gamer.new()
intro.hello()

player_name = intro.name

middle = GameCar.new()
middle.choice(player_name)

player_card = middle.card

puts "You have picked the #{player_card}!"
