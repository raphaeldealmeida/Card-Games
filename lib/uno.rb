class Uno
  attr_reader :cards

  def initialize
    @numbers = [:zero, :one, :two, :three, :four, :five, :six, :seven, :eight, :nine]
    @cards = []
    build_cards :blue
    build_cards :green
    build_cards :red
    build_cards :yellow

    4.times {@cards << Card.new(:wild, :wild)}
    4.times {@cards << Card.new(:wild, :draw_four)}
  end

  def build_cards(symbol)
    @cards << Card.new(symbol, :zero)
    (1..9).each do |index|
        2.times { @cards << Card.new(symbol, @numbers[index]) }
    end
    2.times do
      @cards << Card.new(symbol, :reverse)
      @cards << Card.new(symbol, :skip)
      @cards << Card.new(symbol, :draw_two)
    end
  end

end

