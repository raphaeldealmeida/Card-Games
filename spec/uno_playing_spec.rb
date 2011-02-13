require File.dirname(__FILE__) + '/../lib/card.rb'
require File.dirname(__FILE__) + '/../lib/uno.rb'
require File.dirname(__FILE__) + '/../lib/player.rb'

describe Uno, 'on playing' do

  it 'should distribute shuffled cards' do
    @first_deck = Uno.new
    @second_deck = Uno.new
    @first_deck.cards.should_not == @second_deck.cards 
  end
  
  context 'with two players' do
    
    before do
      @game = Uno.new
      @game.add_player :raphael
      @game.add_player :gabriela
    end
    it 'should allow add players' do
      @game.should have(2).players
    end
    
    it 'should dealt seven cards' do
      @game.dealt 7
      
      @game.players.first.should have(7).cards 
      @game.players.last.should have(7).cards 
      
      @game.deck.should have(94).elements
    end
  end
end