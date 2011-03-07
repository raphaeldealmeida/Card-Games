class Player
  attr_accessor :cards
  attr_reader :name

  def initialize(params)
    @name = params[:name]
    @cards = [] 
  end

  def discart(position)
    @cards.delete_at position
  end
end
