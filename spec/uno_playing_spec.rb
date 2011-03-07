require "spec_helper"

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
    
    it 'should dealt seven cards for all players' do
      @game.dealt 7
      
      @game.players.first.should have(7).cards 
      @game.players.last.should have(7).cards 
      
      @game.deck.should have(94).elements
    end
    
    it 'should start expose top card of the stock' do
      @game.dealt 7
      top_card = @game.deck.first  
      @game.start
      @game.discart_pile.first.should == top_card
    end

  end

  context 'the turn' do
    before do
      @game = Uno.new
      @game.add_player :raphael
      @game.add_player :gabriela
      @game.add_player :eduarda
      @game.dealt 7
      @game.start
    end    
  
    it 'should follow with left player' do
      @game.current_player.name.should == :raphael
      @game.discart 1
      @game.current_player.name.should == :gabriela
    end

    it 'should after last return to first' do
      @game.discart 1
      @game.discart 1
      @game.discart 1
      @game.current_player.name.should == :raphael
    end

  end  

end
