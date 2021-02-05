
class GameCar
    attr_reader :x, :y, :angle
    attr_accessor :speed
    def initialize
        @image = Gosu::Image.new("src/media/redcar.png")
        @x = @y = @angle = 0.0
        @speed_min = 180
        @speed_limit = 590
        @score = 0
    end
    def wrap(x, y)
        @x, @y = x, y
    end
    def left
        if @y > 150
            @y -= 4
        else
            @y = 150
        end
    end
    def right
        if @y < 438
            @y += 4
        else
            @y = 438
        end
    end
    def accel
        if x < @speed_limit
            @x += 2
        else
            @x = @speed_limit
        end
    end
    def brake
        if x > @speed_min
            @x -= 2
        else
            @x = @speed_min
        end
    end
    def move
        if x < @speed_limit
            @x += 1
        else
            @x = @speed_limit
        end
    end
    def draw
        @image.draw_rot(@x, @y, ZOrder::CAR, @angle)
    end
    
    def score
        @score
    end
    def collect_rings(rings)
        rings.reject! { |ring| Gosu.distance(@x, @y, 51, 47) < 35 }
    end
end
