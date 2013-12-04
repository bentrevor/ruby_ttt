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
        [HumanPlayer.new(self.input), ComputerPlayer.new(HighestAvailableIndex)]
      when 3
        [ComputerPlayer.new(HighestAvailableIndex), HumanPlayer.new(self.input)]
      when 4
        [ComputerPlayer.new(HighestAvailableIndex), ComputerPlayer.new(HighestAvailableIndex)]
      end
  end
end
