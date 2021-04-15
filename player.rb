# frozen_string_literal: true

class Player
  attr_reader :name, :bank, :hand, :scores

  SHIRT = 'X'

  def initialize(name, bank, visible)
    @name = name
    @bank = bank
    @hand = []
    @scores = 0
    @visible = visible
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
    if @visible
      @hand
    else
      @hand.map { SHIRT }
    end
  end

  def not_enough_money?
    bank < BlackJack::BET
  end

  def transfer_from(sum)
    @bank -= sum
  end

  def transfer_to(sum)
    @bank += sum
  end

  def drop_cards
    @hand = []
    @scores = 0
  end

  def full_hand?
    hand.length == 3
  end

  def make_visible!
    @visible = true
  end

  def make_unvisible!
    @visible = false
  end
end
