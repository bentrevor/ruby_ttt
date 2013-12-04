require 'spec_helper'
require 'computer_player'

describe ComputerPlayer do
  let(:board) { Board.new 3 }

  it "can get the lowest index" do
    strategy = LowestAvailableIndex
    player = ComputerPlayer.new strategy

    player.get_move(board).should == 0
  end

  it "can get the highest index" do
    strategy = HighestAvailableIndex
    player = ComputerPlayer.new strategy

    player.get_move(board).should == 8
  end
end

