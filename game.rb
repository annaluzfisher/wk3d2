require_relative "card.rb"
require_relative "board.rb"
require 'byebug'

class Game
    attr_reader :board
    def initialize(n)
        @board = Board.new(n)
        @board.populate
    end

    def make_guess
        input = gets.chomp.split("")
        idx1 = input[0].to_i
        idx2 = input[-1].to_i
        pos = [idx1, idx2]
        if @board[pos].visible
            raise "that spot is taken"
        end
        @board.reveal(pos)
        @board.print_current_board
        pos
    end

    def play
        while !@board.won?
            @board.print_current_board
            guess = []
            2.times do
                guess<< self.make_guess 
            end
         
            if @board.match?(guess[0], guess[1])
                @board[guess[0]].show
                @board[guess[1]].show
            else
                @board[guess[0]].hide
                @board[guess[1]].hide

            end
            sleep 2
          systen("cls")
        end
        puts "You win! Play again?"
    end

end

g = Game.new(4)
g.play