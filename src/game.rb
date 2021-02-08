class Done
    attr_reader :score, :end_game
    def initialize
        @goal = 10
        @end_game = false
    end
    def game_over(score)
        if score == @goal
            @end_game = true
        end
    end
end
