# frozen_string_literal: true

class Player
  def initialize(name, bank)
    @name = name
    @bank = bank
    @hand = []
    @scores = 0
  end

  def take_a_card(card)
    @hand << card
    calculate_scores(card)
  end

  def card_price(card)
    return 1 if card.ace? && (11 + @scores) >= 21

    card.price
  end

  def calculate_scores(card)
    @scores += card_price(card)
  end

  def show_hand
    @hand
  end
end
