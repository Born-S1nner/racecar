class GameCar
    attr_reader :x, :y
    attr_accessor :speed
    def initialize
        @image = Gosu::Image.new("src/media/redcar.png")
        @x = @y = 0
        @speed_min = 40
        @speed_limit = 590
        @score = 0
    end
    def wrap(x, y)
        @x, @y = x, y
    end
    def left
        if @y > 20
            @y -= 4
        else
            @y = 20
        end
        puts @y
    end
    def right
        if @y < 430
            @y += 4
        else
            @y = 430
        end
    end
    def accel
        if x < @speed_limit
            @x += 4
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
        if x > @speed_min
            @x -= 1
        else
            @x = @speed_min
        end
    end
    def draw
        @image.draw_rot(@x, @y, ZOrder::CAR, 0)
    end
    
    def score
        @score
    end
    def collect_rings(rings)
        rings.reject! { |ring| Gosu.distance(@x, @y, ring.x, ring.y) < 35 }
    end
end
