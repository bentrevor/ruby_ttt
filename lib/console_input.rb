class ConsoleInput
  attr_accessor :reader

  def initialize(reader)
    self.reader = reader
  end

  def get_int
    input = reader.gets

    if input =~ /^\d+$/
      input.to_i
    else
      get_int
    end
  end
end
