require 'game'

describe Game do
  it "knows when a game is over" do
    game = Game.new
    game.should_not be_over

    game.board.rows = [['x','x','x'],
                       ['o','o','x'],
                       ['x','o','o']]

    game.should be_over

    game.board.rows = [['x','x','x'],
                       ['o','o',' '],
                       ['x','o',' ']]

    game.should be_over
  end

  it "knows when someone wins a row" do
    game = Game.new

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
    game = Game.new

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
    game = Game.new

    game.board.rows = [['o','x','x'],
                       ['o','o','x'],
                       ['x','x','o']]

    game.winner.should == 'o'

    game.board.rows = [['o','o','x'],
                       ['o','x',' '],
                       ['x','o','x']]

    game.winner.should == 'x'
  end
end
