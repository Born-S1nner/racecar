class Road
    attr :speed
    def initialize()
        @background_image = Gosu::Image.new("src/media/background.png", :tileable => true)
        @x = @y = 0.0
    end
    def draw
        @background_image.draw(@x, @y, ZOrder::BACKGROUND)
    end
end

class Ring
    attr_reader :x, :y
    def initialize(animation)
        @animation = animation
        @color = Gosu::Color::YELLOW.dup
        @x = rand * 590
        @y = rand * 410
    end
    def draw
        ring = @animation[Gosu.milliseconds / 100 % @animation.size]
        ring.draw(@x - ring.width / 2.0, @y - ring.height / 2.0, ZOrder::RINGS, 1, 1, @color, :add)
    end
end
