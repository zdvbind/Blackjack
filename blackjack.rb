class BlackJack
  PLAYER_BANK = 100
  BET = 10
  def initialize
    @ui = UserInterface.new
    @bank_of_game = 0
  end

  def start
    preparation
    loop do
      break if not_enough_money?

      game
      break unless @ui.one_more_game?
    end
  end

  def preparation
    @ui.show_information('Welcolme to Blackjack for TN!!!')
    player_name = @ui.player_intro
    @ui.show_information("Hello #{player_name}")
    @player = Player.new(player_name, PLAYER_BANK)
    @dealer = Player.new('Dealer', PLAYER_BANK)
    @deck = Deck.new
  end

  def game
    @deck.shuffle!
    @ui.show_information('The deck is shuffled')
    drop_cards
    place_bets
    show_balance
    deal_cards
    # Показать карты (предусмотреть XX у дилера)
    # Цикл
    #   выход если игрок говорит 'Показать карты' (Описать метод ИгрокГоворит)
    #   выход если у обоих игроков полные руки

    #   Дилер говорит (Описать метод дилер говорит)
    #   выход если у обоих игроков полные руки
    # Подсчитать результат(написать метод)
  end

  def place_bets
    @bank_of_game += BET * 2
    @player.transfer_from(BET)
    @dealer.transfer_from(BET)
  end

  def not_enough_money?
    if @player.not_enough_money?
      @ui.not_enough_money_inf(@player)
      return true
    end
    if @dealer.not_enough_money?
      @ui.not_enough_money_inf(@dealer)
      return true
    end
    false
  end

  def show_balance
    @ui.show_balance(@player)
    @ui.show_balance(@dealer)
    @ui.show_information("Bank of game $#{@bank_of_game}")
  end

  def drop_cards
    @player.drop_cards
    @dealer.drop_cards
  end

  def deal_cards
    2.times do
      @player.take_a_card(@deck.give_a_card)
      @dealer.take_a_card(@deck.give_a_card)
    end
  end
end
