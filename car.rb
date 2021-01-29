class Gamer
    attr :name
    def hello
        puts "Give us your name, Gamer..."
        @name = name = gets.chomp()
        respond = "Hello, #{name}..."
        puts respond
    end
end

class GameCar
    attr :card
    def choice(name)
        questi = "Choose your card, #{name}:\n(a) Spade\n(b) Heart\n(c) Clover\n(d) Diamond"
        shape = ""
        ready = false

        puts questi
        shape = gets.chomp()
        while !ready
            if shape == "a" or shape == "spade"
                @card = "Spade"
                ready = true
            elsif shape == "b" or shape == "heart"
                @card = "Heart"
                ready = true
            elsif shape == "c" or shape == "clover"
                @card = "Clover"
                ready = true
            elsif shape == "d" or shape == "diamond"
                @card = "Diamond"
                ready = true
            else
                puts "Not an option, pick a card"
                shape = gets.chomp()
            end
        end
    end
end
