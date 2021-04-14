class BlackJack
  PLAYER_BANK = 100
  def initialize
    @ui = UserInterface.new
    @bank_of_game = 0
  end

  def start
    preparation
    loop do
      break # если кончились у кого нить деньги в банке (написать метод)
      game
      break # если не выбрано продолжении игры
    end
  end

  def preparation
    @ui.show_information('Welcolme to Blackjack for TN!!!')
    player_name = @ui.player_intro
    @ui.show_information("Hello #{player_name}")
    @user = Player.new(player_name, PLAYER_BANK)
    @dealer = Player.new('Dealer', PLAYER_BANK)
    deck = Deck.new
    deck.shuffle!
    @ui.show_information('The deck is shuffled')
  end

  def game
    # Сделать ставки (написать метод)
    # Показать баланс (банки игрока и дилера)
    # Показать банк игры
    # Раздать карты
    # Показать карты (предусмотреть XX у дилера)
    # Цикл
    #   выход если игрок говорит 'Показать карты' (Описать метод ИгрокГоворит)
    #   выход если у обоих игроков полные руки

    #   Дилер говорит (Описать метод дилер говорит)
    #   выход если у обоих игроков полные руки
    # Подсчитать результат(написать метод)
  end
end
