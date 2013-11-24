require 'human_player'

describe HumanPlayer do
  it "gets a move from stdin" do
    reader = MockReader.new
    input = ConsoleInput.new reader
    reader.inputs = ["5\n"]
    board = Board.new 3

    player = HumanPlayer.new input

    player.get_move(board).should == 5
  end
end

