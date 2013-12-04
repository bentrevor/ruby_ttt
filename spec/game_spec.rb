require 'spec_helper'
require 'game'
require 'console_output'
require 'computer_player'

describe Game do
  let(:output) { ConsoleOutput.new(MockWriter.new) }
  let(:input) { ConsoleInput.new(MockReader.new) }
  let(:game) { Game.new(3, output, Menu.new(input)) }
  let(:player1) { ComputerPlayer.new(LowestAvailableIndex.new) }
  let(:player2) { ComputerPlayer.new(LowestAvailableIndex.new) }

  before :each do
    game.current_player = player1
    game.other_player = player2
    output.stub :clear_screen
  end

  it "knows when a game is over" do
    game.should_not be_game_over

    game.board.rows = [['x','x','x'],
                       ['o','o','x'],
                       ['x','o','o']]

    game.should be_game_over

    game.board.rows = [['x','x','x'],
                       ['o','o',' '],
                       ['x','o',' ']]

    game.should be_game_over
  end

  it "knows when someone wins a row" do
    game.board.rows = [['x','x','x'],
                       ['o','o','x'],
                       ['x','o','o']]

    game.winner.should == 'x'

    game.board.rows = [['x','x',' '],
                       ['o','o','o'],
                       ['x','o','x']]

    game.winner.should == 'o'
  end

  it "knows when someone wins a column" do
    game.board.rows = [['o','x','x'],
                       ['o','o','x'],
                       ['x','o','x']]

    game.winner.should == 'x'

    game.board.rows = [['x','o','x'],
                       ['o','o',' '],
                       ['x','o','x']]

    game.winner.should == 'o'
  end

  it "knows when someone wins a diagonal" do
    game.board.rows = [['o','x','x'],
                       ['o','o','x'],
                       ['x','x','o']]

    game.winner.should == 'o'

    game.board.rows = [['o','o','x'],
                       ['o','x',' '],
                       ['x','o','x']]

    game.winner.should == 'x'
  end

  it "can swap the current player" do
    game.swap_players

    assert_players_were_swapped game, player1, player2
  end

  it "can play a single turn" do
    game.next_turn
    game.board.spaces[0].should == 'x'

    assert_players_were_swapped game, player1, player2

    game.next_turn
    game.board.spaces[1].should == 'o'
  end

  it "prints the board every turn" do
    output.should_receive :clear_screen

    game.next_turn
    printed_board = game.output.printable_board game.board

    game.output.writer.printed_strings.should include printed_board
  end

  it "can play a whole game" do
    game.current_player = ComputerPlayer.new LowestAvailableIndex.new
    game.other_player = ComputerPlayer.new HighestAvailableIndex.new

    game.play

    game.winner.should == 'x'
  end

  it "uses a menu to choose the players" do
    fake_reader = MockReader.new
    fake_reader.inputs = ["1\n"]
    input = ConsoleInput.new fake_reader
    menu = Menu.new input
    game = Game.new 3, output, menu

    game.init_players

    game.current_player.class.should == HumanPlayer
    game.other_player.class.should == HumanPlayer
  end

  private

  def assert_players_were_swapped(game, first_player, second_player)
    game.current_player.should == second_player
    game.other_player.should == first_player
  end

end
