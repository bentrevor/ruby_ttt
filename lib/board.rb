
class Board
  attr_accessor :rows, :width

  def initialize(width)
    self.width = width
    self.rows = []

    width.times do |i|
      self.rows << Array.new(width, ' ')
    end
  end

  def empty_spaces
    spac = []

    self.rows.flatten.each_with_index do |token, index|
      if token == ' '
        spac << index
      end
    end

    spac
  end

  def spaces
    self.rows.flatten
  end

  def place(index)
    row, column = coordinates_from index

    self.rows[row][column] = self.current_token
  end

  def token_at(index)
    row, column = coordinates_from index

    self.rows[row][column]
  end

  def current_token
    first_player_turn? ? 'x' : 'o'
  end

  private

  def first_player_turn?
    self.rows.length % 2 == self.empty_spaces.length % 2
  end

  def coordinates_from(index)
    return index / self.width, index % self.width
  end
end
