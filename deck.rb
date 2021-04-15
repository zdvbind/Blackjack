# frozen_string_literal: true

require_relative 'card'

class Deck
  attr_reader :deck

  def initialize
    # Use native algoritm to create deck of cards. Need to use another algoritm in future.
    @deck = []
    Card::SUITS.each do |suit|
      Card::RANKS.each_key do |rank|
        @deck << Card.new(rank, suit)
      end
    end
  end

  def shuffle!
    deck.shuffle!.reverse!.shuffle!
  end

  def give_a_card
    deck.pop
  end
end
