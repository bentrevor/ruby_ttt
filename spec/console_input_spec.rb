require 'console_input'

describe ConsoleInput do
  let(:reader) { MockReader.new }

  it "reads from stdin" do
    reader.inputs = ["1\n", "2\n"]

    input = ConsoleInput.new(reader)

    input.get_int.should == 1
    input.get_int.should == 2
  end

  it "prompts until it gets an int" do
    reader.inputs = ["", "yo\n", "2\n"]

    input = ConsoleInput.new(reader)

    input.get_int.should == 2
  end
end

class MockReader
  attr_accessor :inputs

  def gets
    self.inputs.shift
  end
end

