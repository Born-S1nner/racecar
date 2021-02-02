require 'gosu'

require_relative "src/car.rb"
require_relative "src/road.rb"
require_relative "src/player.rb"

intro = Gamer.new()
intro.hello()

module ZOrder
    BACKGROUND, CAR = *0..5
end

class Game_set < Gosu::Window
    def initialize
        super 640, 480
        self.caption = "Ruby Racer"
        @racer = GameCar.new()
        @racer.wrap(190, 150)
        @background_image = Road.new()
    end
    def update
        if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
            @racer.left
        end
        if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
            @racer.right
        end
        if Gosu.button_down? Gosu::KB_A or Gosu::button_down? Gosu::GP_UP
            @racer.accel
        end
        
        if Gosu.button_down? Gosu::KB_S or Gosu::button_down? Gosu::GP_DOWN
            @racer.brake
        end
        @racer.move()
    end
    def draw
        @racer.draw
        @background_image.draw()
    end
end

Game_set.new.show
