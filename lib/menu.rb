class Menu
  attr_accessor :input

  def initialize(input)
    self.input = input
  end

  def choose_players_from_menu_choice
    menu_choice = self.input.get_int

    case menu_choice
      when 1
        [HumanPlayer.new(self.input), HumanPlayer.new(self.input)]
      when 2
        [HumanPlayer.new(self.input), ComputerPlayer.new("Minimax")]
      when 3
        [ComputerPlayer.new("Minimax"), HumanPlayer.new(self.input)]
      when 4
        [ComputerPlayer.new("Minimax"), ComputerPlayer.new("Minimax")]
      end
  end
end
