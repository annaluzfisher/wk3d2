require_relative "card.rb"
require_relative "board.rb"

class Game
    attr_reader :board
    def initialize(n)
        @board = Board.new(n)
        @board.populate
        @board.print_current_board
    end

    def make_guess
        input = gets.chomp.split("")
        idx1 = input[0].to_i
        idx2 = input[-1].to_i
        pos = [idx1, idx2]
        # idx2 = gets.chomp.split(" ")
        @board.reveal(pos)
        @board.print_current_board
        pos
    end

    def play
        until @board.flatten.all? {|card| card.visible == true}
        @board.print_current_board
        guesses[]
       2.times do
        guesses << self.make_guess ; sleep 3
       end
        if @board.match?(guess[0], guess[1])
            @board[guess[0]].show
            @board[guess[1]].show
        else
            @board[guess[0]].hide
            @board[guess[1]].hide

        end
    end
    end

end