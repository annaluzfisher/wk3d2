class Card
    attr_reader :value , :displayed
    attr_accessor :visible

    def initialize(value)
        @value = value
        @displayed = " "
        @visible = false
    end

    def show
        self.visible = true
    end

    def hide
        self.visible = false
    end
    
end