require 'menu'

describe Menu do
  it "sets the players" do
    reader = MockReader.new
    reader.inputs = ["1\n", "2\n", "3\n", "4\n"]
    input = ConsoleInput.new reader

    menu = Menu.new input
    players = menu.choose_players_from_menu_choice

    players[0].class.should == HumanPlayer
    players[1].class.should == HumanPlayer

    players = menu.choose_players_from_menu_choice

    players[0].class.should == HumanPlayer
    players[1].class.should == ComputerPlayer

    players = menu.choose_players_from_menu_choice

    players[0].class.should == ComputerPlayer
    players[1].class.should == HumanPlayer

    players = menu.choose_players_from_menu_choice

    players[0].class.should == ComputerPlayer
    players[1].class.should == ComputerPlayer
  end
end

