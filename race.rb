require_relative "src/car.rb"
require_relative "src/road.rb"
require_relative "src/player.rb"

intro = Gamer.new()
intro.hello()

player_name = intro.name

middle = GameCar.new()
middle.choice(player_name)

player_card = middle.card

road = Road.new()
road.road_setup(player_card)
