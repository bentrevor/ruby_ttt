require 'spec_helper'
require 'console_output'

describe ConsoleOutput do
  let(:fake_writer) { MockWriter.new }
  let(:output) { ConsoleOutput.new fake_writer }
  let(:board_3x3) { Board.new 3 }
  let(:board_4x4) { Board.new 4 }

  it "can print a board" do
    board_3x3.rows = [[' ','o','x'],
                      ['o','x',' '],
                      [' ',' ',' ']]

    board_4x4.rows = [[' ','o','x','o'],
                      ['o','x',' ','x'],
                      [' ',' ',' ','o'],
                      [' ',' ',' ','x']]

    printable_3x3_board = output.printable_board board_3x3
    printable_4x4_board = output.printable_board board_4x4

    printable_3x3_board.should include "   | o | x \n"
    printable_3x3_board.should include "---+---+---\n"
    printable_3x3_board.should include " o | x |   \n"
    printable_3x3_board.should include "---+---+---\n"
    printable_3x3_board.should include "   |   |   \n"

    printable_4x4_board.should include "   | o | x | o \n"
    printable_4x4_board.should include "---+---+---+---\n"
    printable_4x4_board.should include " o | x |   | x \n"
    printable_4x4_board.should include "---+---+---+---\n"
    printable_4x4_board.should include "   |   |   | o \n"
    printable_4x4_board.should include "---+---+---+---\n"
    printable_4x4_board.should include "   |   |   | x \n"
  end

  it "can print a legend" do
    printable_3x3_legend = output.printable_legend 3
    printable_4x4_legend = output.printable_legend 4

    printable_3x3_legend.should include "  1  2  3 \n"
    printable_3x3_legend.should include "  4  5  6 \n"
    printable_3x3_legend.should include "  7  8  9 \n"

    printable_4x4_legend.should include " 1  2  3  4 \n"
    printable_4x4_legend.should include " 5  6  7  8 \n"
    printable_4x4_legend.should include " 9 10 11 12 \n"
    printable_4x4_legend.should include "13 14 15 16 \n"
  end

  it "shows a legend and instructions with the board" do
    board = board_3x3
    printed_legend = output.printable_legend board.width
    printed_board = output.printable_board board

    output.show_board board

    output.writer.printed_strings[0].should == printed_legend
    output.writer.printed_strings[1].should == output.instructions
    output.writer.printed_strings[2].should == printed_board
  end
end

