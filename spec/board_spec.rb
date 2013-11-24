require 'board'

describe Board do
  let (:board_3x3) { Board.new 3 }
  let (:board_4x4) { Board.new 4 }

  it "is constructed with a size" do
    board_3x3.rows.length.should == 3
    board_3x3.spaces.length.should == 9
    board_4x4.rows.length.should == 4
    board_4x4.spaces.length.should == 16

    board_3x3.rows[0].should == [' ',' ',' ']
    board_4x4.rows[0].should == [' ',' ',' ',' ']
  end

  it "can place a token" do
    board_3x3.place 0
    board_3x3.place 1

    board_3x3.token_at(0).should == 'x'
    board_3x3.token_at(1).should == 'o'
  end

  it "knows the current token" do
    board_3x3.current_token.should == 'x'
    board_3x3.place 0
    board_3x3.current_token.should == 'o'

    board_4x4.current_token.should == 'x'
    board_4x4.place 0
    board_4x4.current_token.should == 'o'
  end

  it "knows the empty spaces" do
    board_3x3.rows[0][2] = 'o'
    board_3x3.rows[2] = ['o','o','x']

    board_3x3.empty_spaces.should == [0,1,3,4,5]

    board_4x4.rows[0][2] = 'o'
    board_4x4.rows[2] = ['o','o','x','x']

    board_4x4.empty_spaces.should == [0,1,3,4,5,6,7,12,13,14,15]
  end
end
