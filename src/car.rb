
class GameCar
    attr_reader :x, :y, :angle
    attr_accessor :speed
    def initialize
        @image = Gosu::Image.new("src/media/redcar.png")
        @x = 0.0
        @y = 0.0
        @angle = 0.0
        @speed_limit = 538
    end
    def wrap(x, y)
        @x = x
        @y = y
    end
    def left
        @y += 1
    end
    def right
        @y -= 1
    end
    def accel
        if x < @speed_limit
            @x += 2
        else
            @x = @speed_limit
        end
    end
    def rever
        @x -= 1
    end
    def draw
        @image.draw_rot(@x, @y, ZOrder::CAR, @angle)
    end
end
