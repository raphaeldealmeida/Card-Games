class Uno
  attr_reader :cards, :players
  attr_accessor :deck

  def initialize
    @numbers = [:zero, :one, :two, :three, :four, :five, :six, :seven, :eight, :nine]
    @cards = []
    @players = []
    build_cards :blue
    build_cards :green
    build_cards :red
    build_cards :yellow

    4.times {@cards << Card.new(:wild, :wild)}
    4.times {@cards << Card.new(:wild, :draw_four)}

    @deck = @cards
    @deck.shuffle!

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
  
  def add_player(player_name)
    @players << Player.new({:name => player_name})
  end
  
  def dealt(amount_cards=7)
    @players.each { |player| player.cards = @deck.shift(amount_cards) }
  end
  
  def deck
    cards
  end
  
end

