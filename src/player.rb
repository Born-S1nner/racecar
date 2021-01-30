class Gamer
    attr :name
    def hello
        puts "Give us your name, Gamer..."
        @name = name = gets.chomp()
        respond = "Hello, #{name}..."
        puts respond
    end
end
