class HumanPlayer
  attr_accessor :input

  def initialize(input)
    self.input = input
  end

  def get_move(board)
    self.input.get_int
  end
end

