require 'board'

class Game
  attr_accessor :board

  def initialize
    self.board = Board.new 3
  end

  def over?
    self.board.empty_spaces.length == 0 or winner
  end

  def winner
    check_row_winner or check_column_winner or check_diagonal_winner
  end

  private

  def check_all_same_token(lines)
    lines.each do |line|
      if line.all? { |token| token == line[0] } and line[0] != ' '
        return line[0]
      end
    end

    nil
  end

  def check_row_winner
    rows = self.board.spaces

    check_all_same_token rows
  end

  def check_column_winner
    columns = []
    self.board.width.times do |i|
      column = []
      self.board.width.times do |j|
        column << self.board.spaces[j][i]
      end

      columns << column
    end

    check_all_same_token columns
  end

  def check_diagonal_winner
    slash_diagonal = []
    backslash_diagonal = []

    self.board.spaces.each_with_index do |row, index|
      slash_diagonal << row[(self.board.width - 1) - index]
      backslash_diagonal << row[index]
    end

    diagonals = [slash_diagonal, backslash_diagonal]

    check_all_same_token diagonals
  end
end
