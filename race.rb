require 'gosu'

require_relative "src/car.rb"
require_relative "src/road.rb"

module ZOrder
    BACKGROUND, RINGS, CAR = *0..3
end

class Game_set < Gosu::Window
    def initialize
        super 640, 480
        self.caption = "Ruby Racer"

        @racer = GameCar.new()
        @racer.wrap(190, 150)

        @background_image = Road.new()

        @ring_anim = Gosu::Image.load_tiles("src/media/ringer.png", 51, 47)
        @rings = Array.new
    end
    def update
        if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
            @racer.left
        end
        if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
            @racer.right
        end
        if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_UP
            @racer.accel
        end
        if Gosu.button_down? Gosu::KB_DOWN or Gosu::button_down? Gosu::GP_DOWN
            @racer.brake
        end
        @racer.move()
        @racer.collect_rings(@rings)
        if rand(100) < 4 and @rings.size < 25
            @rings.push(Ring.new(@ring_anim))
        end
    end
    def draw
        @background_image.draw()
        @racer.draw
        @rings.each { |ring| ring.draw}
    end
end

Game_set.new.show
