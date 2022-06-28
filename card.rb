class Card
    attr_reader :value , :displayed, :visible

    def initialize(value)
        @value = value
        @dispalyed = ""
        @visible = false
    end

    def show
        @displayed = @value
        @visible = true
    end

    def hide
        @dispalyed  = ""
        @visible = false
    end
end