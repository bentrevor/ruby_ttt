
class MockWriter
  attr_accessor :printed_strings

  def initialize
    self.printed_strings = Array.new
  end

  def print(str)
    printed_strings << str
  end
end
class MockReader
  attr_accessor :inputs

  def gets
    self.inputs.shift
  end
end

class LowestAvailableIndex
  def self.next_move(board)
    board.empty_spaces.first
  end
end

class HighestAvailableIndex
  def self.next_move(board)
    board.empty_spaces.last
  end
end
