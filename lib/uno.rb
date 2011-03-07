class Uno
  attr_reader :cards, :players, :discart_pile, :current_player
  attr_accessor :deck

  def initialize
    @numbers = [:zero, :one, :two, :three, :four, :five, :six, :seven, :eight, :nine]
    @cards = []
    @players = []
    @discart_pile = []
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

  def start
    @discart_pile << @deck.shift
    @current_player = @players.first
  end

  def discart(position)
    @discart_pile << @current_player.discart(position)
    index_player = @players.index @current_player
    index_player = -1 if ((index_player+1) > (@players.count-1))
    @current_player = @players.at index_player+1
  end
  
end

