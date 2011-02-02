require File.dirname(__FILE__) + '/../lib/card.rb'
require File.dirname(__FILE__) + '/../lib/uno.rb'

describe Uno do

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

  end

  context 'on create' do
    before do
      @uno = Uno.new
    end

    it 'should have 108 cards' do
      subject.should have(108).cards
    end

    context 'numeric cards' do

      it 'should have 19 Blue cards' do
        blue_cards = find_cards :blue
        blue_cards = blue_cards.find_all {|card| card.number != :reverse and card.number != :skip and card.number != :draw_two}
        blue_cards.should have(19).cards
      end

      it 'should have one card color Blue number Zero' do
        subject.cards.should be_one {|card| card.color == :blue and
                                            card.number == :zero }
      end

      it 'should have 2 cards Blue number One' do
        blue_one_card = find_cards(:blue, :one)
        blue_one_card.should have(2).elements
      end

      it 'should have 19 Green cards' do
        green_cards = find_cards :green
        green_cards = green_cards.find_all {|card| card.number != :reverse and card.number != :skip and card.number != :draw_two}
        green_cards.should have(19).elements
      end

      it 'should have 19 Red cards' do
        red_cards = find_cards :red
        red_cards = red_cards.find_all {|card| card.number != :reverse and card.number != :skip and card.number != :draw_two}
        red_cards.should have(19).elements
      end

      it 'should have 19 Yellow cards' do
        yellow_cards = find_cards :yellow
        yellow_cards = yellow_cards.find_all {|card| card.number != :reverse and card.number != :skip and card.number != :draw_two}
        yellow_cards.should have(19).elements
      end
    end

    context 'reverse cards' do
      it 'should have eight reverse cards' do
        reverse_cards = subject.cards.find_all {|card| card.number == :reverse}
        reverse_cards.should have(8).cards
      end

      it 'should have two blue reverse cards' do
        blue_reverse_cards = find_cards :blue, :reverse
        blue_reverse_cards.should have(2).elements
      end

      it 'should have two red reverse cards' do
        red_reverse_cards = find_cards :red, :reverse
        red_reverse_cards.should have(2).elements
      end

      it 'should have two green reverse cards' do
        green_reverse_cards = find_cards :green, :reverse
        green_reverse_cards.should have(2).elements
      end

      it 'should have two yellow reverse cards' do
        yellow_reverse_cards = find_cards :yellow, :reverse
        yellow_reverse_cards.should have(2).elements
      end

    end

    context 'skiped cards' do
      it 'should have eight skiped cards' do
        skip_cards = subject.cards.find_all {|card| card.number == :skip}
        skip_cards.should have(8).cards
      end

      it 'should have two blue skiped cards' do
        blue_skip_cards = find_cards :blue, :skip
        blue_skip_cards.should have(2).elements
      end

      it 'should have two red skiped cards' do
        red_skip_cards = find_cards :red, :skip
        red_skip_cards.should have(2).elements
      end

      it 'should have two green skiped cards' do
        green_skip_cards = find_cards :green, :skip
        green_skip_cards.should have(2).elements
      end

      it 'should have two yellow skip cards' do
        yellow_skip_cards = find_cards :yellow, :reverse
        yellow_skip_cards.should have(2).elements
      end

    end

    context 'draw two cards' do
      it 'should have eight Draw Two cards' do
        draw_two_cards = subject.cards.find_all {|card| card.number == :draw_two}
        draw_two_cards.should have(8).cards
      end

      it 'should have two blue Draw Two cards' do
        blue_draw_two_cards = find_cards :blue, :draw_two
        blue_draw_two_cards.should have(2).elements
      end

      it 'should have two red Draw Two cards' do
        red_draw_two_cards = find_cards :red, :draw_two
        red_draw_two_cards.should have(2).elements
      end

      it 'should have two green Draw Two cards' do
        green_draw_two_cards = find_cards :green, :draw_two
        green_draw_two_cards.should have(2).elements
      end

      it 'should have two yellow Draw Two cards' do
        yellow_draw_two_cards = find_cards :yellow, :draw_two
        yellow_draw_two_cards.should have(2).elements
      end

    end

    context 'wild cards' do
      it 'should have four Wild cards' do
        wild_cards = find_cards :wild, :wild
        wild_cards.should have(4).cards
      end

      it 'should have four Wild Draw Four cards' do
        wild_draw_four_cards = find_cards :wild, :draw_four
        wild_draw_four_cards.should have(4).cards
      end
    end

    def find_cards(color, number = nil)
      subject.cards.find_all do |card|
        if number.nil?
          card.color == color
        else
          card.color == color and card.number == number
        end
      end
    end

  end

end

