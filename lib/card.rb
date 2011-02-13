class Card

  attr_reader :color, :number

  def initialize(color, number)
    @color = color
    @number = number
  end
  
  def ==(card)
    return false if card.class != self.class
    (color == card.color) and (@number == card.number)
  end
end

