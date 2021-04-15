# frozen_string_literal: true

class BlackJack
  PLAYER_BANK = 100
  BET = 10
  DEALER_LIMIT = 17

  attr_reader :ui, :player, :dealer, :deck

  def initialize
    @ui = UserInterface.new
    @bank_of_game = 0
    @skipped = false
  end

  def start
    preparation
    loop do
      break if not_enough_money?

      game
      break unless ui.one_more_game?
    end
  end

  def preparation
    ui.show_information('Welcolme to Blackjack for TN!!!')
    player_name = ui.player_intro
    ui.show_information("Hello #{player_name}")
    @player = Player.new(player_name, PLAYER_BANK, true)
    @dealer = Player.new('Dealer', PLAYER_BANK, false)
  end

  def game
    @deck = Deck.new
    deck.shuffle!
    ui.show_information('The deck is shuffled')
    drop_cards
    drop_skipped
    place_bets
    show_balance
    deal_cards
    show_cards
    loop do
      break if choose_player == :show
      break if player.full_hand? && dealer.full_hand?

      show_cards
      choose_dealer
      show_cards
      break if player.full_hand? && dealer.full_hand?
    end
    show_results
  end

  def place_bets
    @bank_of_game += BET * 2
    player.transfer_from(BET)
    dealer.transfer_from(BET)
  end

  def not_enough_money?
    if player.not_enough_money?
      ui.not_enough_money_inf(player)
      return true
    end
    if dealer.not_enough_money?
      ui.not_enough_money_inf(dealer)
      return true
    end
    false
  end

  def show_balance
    ui.show_balance(player)
    ui.show_balance(dealer)
    ui.show_information("Bank of game $#{@bank_of_game}")
  end

  def drop_cards
    player.drop_cards
    dealer.drop_cards
  end

  def deal_cards
    2.times do
      player.take_a_card(deck.give_a_card)
      dealer.take_a_card(deck.give_a_card)
    end
  end

  def show_cards
    ui.show_cards(player)
    ui.show_cards(dealer)
  end

  def show_scores
    ui.show_scores(player)
    ui.show_scores(dealer)
  end

  def choose_player
    player_action = ui.player_menu(player.full_hand?, skipped?)
    player.take_a_card(deck.give_a_card) if player_action == :add
    @skipped = true if player_action == :skip
    player_action
  end

  def skipped?
    @skipped
  end

  def drop_skipped
    @skipped = false
  end

  def choose_dealer
    if dealer.scores >= DEALER_LIMIT
      @skipped = true
    else
      dealer.take_a_card(deck.give_a_card)
    end
  end

  def show_results
    dealer.make_visible!
    show_cards
    show_scores
    counting_result
    show_balance
    dealer.make_unvisible!
  end

  def counting_result
    if (player.scores > dealer.scores && player.scores < 22) || (player.scores < 22 && dealer.scores > 21)
      player_wins(player)
    elsif (player.scores == dealer.scores) || (player.scores > 21 && dealer.scores > 21)
      tie
    else
      player_wins(dealer)
    end
  end

  def player_wins(player)
    ui.player_wins(player)
    player.transfer_to(@bank_of_game)
    @bank_of_game = 0
  end

  def tie
    @bank_of_game = 0
    ui.tie
    player.transfer_to(BET)
    dealer.transfer_to(BET)
  end
end
