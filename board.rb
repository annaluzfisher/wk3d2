
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
            sub.each do |card|
               print "| #{card.value} |"
            end
            print "\n"
            print"----" * @length
            print "\n"
        end
       end

       def print_hidden_grid
        @grid.each do |sub|
            sub.each do |card|
               print "#{card.displayed} "
            end
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
        row1 = pos1[0]
        col1 = pos1[-1]
        row2 = pos2[0]
        col2 = pos2[-1]
        return true if @grid[row1][col1].value == @grid[row2][col2].value
        false
    end
    
end

# b = Board.new(4)
# b.populate
# b.print_current_board
# b.reveal([1, 2])
# b.print_current_board

# c = Board.new(4)
# b.populate
# b.cheat_grid
