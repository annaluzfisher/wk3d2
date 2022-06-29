
require_relative "card.rb"
class Board
attr_reader :grid
    def initialize(num)
        unless num.even?
            raise "Board must be an even size!"
        end
        @grid = Array.new(num) {Array.new(num, " ")}
        @length = num
        @size = num * num
    end
    
    def make_deck
        alph =("a".."z").to_a
        num_cards = @size/2
        cards =[]
       alph[0...num_cards].each do |c|
             cards << Card.new(c) << Card.new(c)
       end
       cards
    end
    

       def populate
        deck = self.make_deck
        deck = deck.shuffle
        (0...@length).each do |n|
        @grid.each_with_index do |subarr, i|
                @grid[i][n] = deck.pop
             end
        end
        @grid
       end

    
       def print_cheat_grid
        @grid.each do |sub|
            sub.each { |card| print "| #{card.value} |" }
            print "\n"
            print"----" * @length
            print "\n"
        end
       end

       def print_hidden_grid
        @grid.each do |sub|
            sub.each { |card|   print "#{card.displayed} " }
            print "\n"
            print"----" * @length
            print "\n"
        end
       end

       def won?
            @grid.all? do |sub|
                sub.all? { |card| card.visible == true }
            end
       end
       
       def [](index)
        row = index[0]
        col = index[-1]
        @grid[row][col]
       end

       def print_current_board
        @grid.each do |sub|
            sub.each do |ele|
               if ele.visible
                print "| #{ele.value} |"
               else
                print "| #{ele.displayed} |"
               end
            end
            print "\n"
            print"----" * @length
            print "\n"
        end
    end

    def reveal(index)
        row = index[0]
        col = index[-1]
        
        if @grid[row][col].visible == false
            @grid[row][col].show
        end
    end

    def match?(pos1,pos2)
        return true if self[pos1].value == self[pos2].value
        false
    end
    
end

