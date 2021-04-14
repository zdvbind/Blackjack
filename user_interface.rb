class UserInterface
  def show_information(inf)
    puts inf
  end

  def player_intro
    loop do
      show_information('Enter your name please')
      player_name = gets.chomp
      return player_name if player_name
    end
  end
end
