# frozen_string_literal: true

require_relative 'card'

class Deck
  attr_reader :deck

  def initialize
    # Use native algoritm to create deck of cards. Need to use another algoritm.
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

  # This method need to debug. Need to delete in future.
  def show_deck
    deck.map(&:to_s)
  end
end
