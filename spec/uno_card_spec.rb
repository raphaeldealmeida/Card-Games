require "spec_helper"

describe Card do
  context 'on create' do
    it 'should have a color' do
      red_card = Card.new :red, :one
      red_card.color.should == :red
    end

    it 'should have a number' do
      card_one = Card.new :blue, :one
      card_one.number.should == :one
    end
  end
  
  context 'on comparation' do
    it 'should be equal with same color and number' do
      card1 = Card.new :blue, :one
      card2 = Card.new :blue, :one
      card1.should == card2
   end
  
    it 'should not be equal with same color and diferent number' do
      card1 = Card.new :blue, :one
      card2 = Card.new :blue, :two
      card1.should_not == card2
   end
    
    it 'should not be equal without cards objects' do
      card1 = Card.new :blue, :one
      card1.should_not == 'some_thing'
   end
  
  end
end
