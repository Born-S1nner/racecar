class Road
    attr :speed
    def initialize()
        @background_image = Gosu::Image.new("src/media/background.png", :tileable => true)
        @x = @y = 0.0
        #@speed = 3.0
    end
=begin
    def accel
        @x += @speed
    end
    def rever
        @x -=speed
        @x -= WIDTH * 2 if @x >= WIDTH
    end
=end
    def draw
        @background_image.draw(@x, @y, ZOrder::BACKGROUND)
    end
end

class Ring
    attr_reader :x, :y
    def initialize(animation)
        @animation = animation
        @color = Gosu::Color::YELLOW.dup
        @x = rand * 640
        @y = rand * 480
    end
    def draw
        ring = @animation[Gosu.milliseconds / 100 % @animation.size]
        ring.draw(@x - ring.width / 2.0, @y - ring.height / 2.0, ZOrder::RINGS, 1, 1, @color, :add)
    end
end
