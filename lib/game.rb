require_relative 'board'

class Game
  attr_accessor :board, :current_player, :other_player, :output

  def initialize(board_size, output)
    self.board = Board.new board_size
    self.output = output
  end

  def next_turn
    move = current_player.get_move(self.board)
    self.board.place move
    output.clear_screen
    output.show_board self.board
    swap_players
  end

  def play
    loop do
      next_turn

      break if game_over?
    end
  end

  def init_players(menu_choice)
  end

  def swap_players
    self.current_player, self.other_player = self.other_player, self.current_player
  end

  def game_over?
    self.board.empty_spaces.length == 0 or winner
  end

  def winner
    check_row_winner or check_column_winner or check_diagonal_winner
  end

  private

  def check_all_same_token(lines)
    lines.each do |line|
      return line[0] if all_same_token(line)
    end

    nil
  end

  def all_same_token(line)
    first_token = line[0]

    first_token != ' ' and line.all? { |token| token == first_token }
  end

  def check_row_winner
    rows = self.board.rows

    check_all_same_token rows
  end

  def check_column_winner
    columns = []
    self.board.width.times do |i|
      column = []
      self.board.width.times do |j|
        column << self.board.rows[j][i]
      end

      columns << column
    end

    check_all_same_token columns
  end

  def check_diagonal_winner
    slash_diagonal = []
    backslash_diagonal = []

    self.board.rows.each_with_index do |row, index|
      slash_diagonal[index] = row[(self.board.width - 1) - index]
      backslash_diagonal[index] = row[index]
    end

    diagonals = [slash_diagonal, backslash_diagonal]

    check_all_same_token diagonals
  end
end
