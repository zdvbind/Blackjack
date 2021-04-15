# frozen_string_literal: true

class UserInterface
  PLAYER_MENU = {
    '1': :skip,
    '2': :add,
    '3': :show
  }.freeze

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

  def show_cards(player)
    show_information("#{player.name}:")
    player.show_hand.each do |card|
      print card
      print ' '
    end
    show_information("\n")
  end

  def show_scores(player)
    puts "#{player.name}:  #{player.scores} scores."
  end

  def player_menu(full_hand, skipped)
    puts 'Make your choise'
    puts 'Skip your turn - 1' unless skipped
    puts 'Add a card - 2' unless full_hand
    puts 'Show cards - 3'
    player_input = gets.chomp.to_sym
    PLAYER_MENU[player_input]
  end

  def results
    puts "#{player.name}: #{player.scores}"
  end

  def player_wins(player)
    puts "#{player.name} wins !!!"
  end

  def tie
    puts 'Tie happens'
  end
end
