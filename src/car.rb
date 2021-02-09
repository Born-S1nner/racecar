class Race_car
    attr_reader :score
    def initialize
        @image = Gosu::Image.new("src/media/car.bmp")
        @x = @y = 0
        @speed_min = 40
        @speed_limit = 593
        @score = 00
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
    end
    def right
        if @y < 410
            @y += 4
        else
            @y = 410
        end
    end
    def accel
        if @x < @speed_limit
            @x += 4
        else
            @x = @speed_limit
        end
    end
    def brake
        if @x > @speed_min
            @x -= 2
        else
            @x = @speed_min
        end
    end
    def move
        if @x > @speed_min
            @x -= 1
        else
            @x = @speed_min
        end
    end
    def draw
        @image.draw_rot(@x, @y, ZOrder::CAR, 0)
    end
    def control(racer)
        if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
            racer.left
        end
        if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
            racer.right
        end
        if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_UP
            racer.accel
        end
        if Gosu.button_down? Gosu::KB_DOWN or Gosu::button_down? Gosu::GP_DOWN
            racer.brake
        end
    end
    
    def score
        @score
    end
    def collect_rings(rings)
        rings.reject! do |ring|
            if Gosu.distance(@x, @y, ring.x, ring.y) < 35
                @score += 10
                true
            else
                false
            end
        end
    end
end
