class UserInterface
  def show_information(inf)
    puts inf
  end

  def player_intro
    show_information('Enter your name please')
    player_name = gets.chomp
    return player_name if player_name
  end

  def one_more_game?
    show_information('Do you want to play one more time? Press Y or N')
    choose = gets.chomp
    choose == 'Y'
  end

  def not_enough_money_inf(player)
    show_information("#{player.name} does not have enough money to play")
    show_information('')
  end

  def show_balance(player)
    show_information("#{player.name} has #{player.bank} dollars")
  end
end
