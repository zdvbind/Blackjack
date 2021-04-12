# frozen_string_literal: true

class Card
  SUITS = ["\u2660", "\u2663", "\u2666", "\u2665"].freeze
  RANKS = {
    'A': 1,
    '2': 2,
    '3': 3,
    '4': 4,
    '5': 5,
    '6': 6,
    '7': 7,
    '8': 8,
    '9': 9,
    '10': 10,
    'J': 2,
    'Q': 3,
    'K': 4
  }.freeze

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    _representation = "#{@rank}#{@suit}"
  end
end
