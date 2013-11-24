class ComputerPlayer
  attr_accessor :strategy

  def initialize(strategy)
    self.strategy = strategy
  end

  def get_move(board)
    strategy.next_move(board)
  end
end

