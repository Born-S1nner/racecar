require 'gosu'

require_relative "src/car.rb"
require_relative "src/road.rb"
require_relative "src/game.rb"

module ZOrder
    BACKGROUND, RINGS, CAR, UI = *0..3
end

class Game_set < Gosu::Window
    def initialize
        super 640, 480
        self.caption = "Ruby Racer"

        @racer = GameCar.new()
        @racer.wrap(190, 150)

        @background_image = Road.new()
        @font = Gosu::Font.new(20)

        @ring_anim = Gosu::Image.load_tiles("src/media/ringer.png", 51, 47)
        @rings = Array.new
        
        @gameOver = Done.new()
    end
    def update
        @racer.control(@racer)
        @racer.move()
        @racer.collect_rings(@rings)
        if rand(300) < 4 and @rings.size < 25
            @rings.push(Ring.new(@ring_anim))
        end
        @gameOver.game_over(@racer.score)
    end
    def draw
        @background_image.draw()
        @racer.draw
        if @gameOver.end_game == false
            @racer.draw
            @rings.each { |ring| ring.draw}
        else
            @font.draw_text("Game Over", 150, 200, ZOrder::UI, 4.0, 4.0, Gosu::Color::YELLOW)
        end
    end
end

Game_set.new.show
