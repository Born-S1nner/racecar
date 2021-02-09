require 'gosu'

require_relative "src/car.rb"
require_relative "src/road.rb"
require_relative "src/game.rb"

module ZOrder
    BACKGROUND, RINGS, CAR, UI = *0..3
end

class Race_game < Gosu::Window
    def initialize
        super 640, 480
        self.caption = "Ruby Ring Race"

        @car = GameCar.new()
        @car.wrap(190, 150)

        @background_image = Road.new()
        @font = Gosu::Font.new(20)

        @ring_anim = Gosu::Image.load_tiles("src/media/ringer.png", 51, 47)
        @rings = Array.new

        @gameOver = Done.new()
    end
    def update
        @car.control(@car)
        @car.move()
        @car.collect_rings(@rings)
        if rand(300) < 4 and @rings.size < 25
            @rings.push(Ring.new(@ring_anim))
        end
        @gameOver.game_over(@car.score)
    end
    def draw
        @background_image.draw()
        @font.draw_text("Score: #{@car.score}", 10, 10, ZOrder::UI, 2.0, 2.0, Gosu::Color::AQUA)
        if @gameOver.end_game == false
            @car.draw
            @rings.each { |ring| ring.draw}
        else
            @font.draw_text("Game Over", 150, 200, ZOrder::UI, 4.0, 4.0, Gosu::Color::YELLOW)
        end
    end
end

Race_game.new.show
