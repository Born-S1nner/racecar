class Road
    attr :speed
    def initialize()
        @background_image = Gosu::Image.new("src/media/background.png", :tileable => true)
        @x = @y = 0.0
        @speed = 3.0
    end
    def draw
        @background_image.draw(@x, @y, ZOrder::BACKGROUND)
    end
end
