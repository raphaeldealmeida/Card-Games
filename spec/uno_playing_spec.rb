require File.dirname(__FILE__) + '/../lib/card.rb'
require File.dirname(__FILE__) + '/../lib/uno.rb'

describe Uno, 'on playing' do

  it 'should distribute cards' do
    @deck = Uno.new
    @deck.cards.shuffle!

  end

end

