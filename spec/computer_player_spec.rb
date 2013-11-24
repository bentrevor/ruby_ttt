require 'spec_helper'
require 'computer_player'

describe ComputerPlayer do
  it "passes" do
    strategy = LowestAvailableIndex.new
    board = Board.new 3
    player = ComputerPlayer.new strategy

    player.get_move(board).should == 0
  end
end

