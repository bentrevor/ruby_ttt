
class ConsoleOutput
  attr_accessor :writer

  def initialize(writer)
    self.writer = writer
  end

  def show_board(board)
    writer.print(printable_legend board.width)
    writer.print(instructions)
    writer.print(printable_board board)
  end

  def printable_board(board)
    size = board.width

    printable_spaces = board.rows.map { |row| printable_row row }.join

    printable_spaces.chomp(spacer size) + "\n"
  end

  def spacer(size)
    spacer = "\n"

    (size - 1).times do
      spacer << "---+"
    end

    spacer << "---\n"
  end

  def printable_row(row)
    row.map do |space|
      " #{space} |"
    end.join.chomp('|') << spacer(row.size)
  end

  def printable_legend(size)
    legend = "\nLegend:\n\n"

    (1..size * size).each do |index|
      legend << " " if index < 10
      legend << " #{index}"
      legend << " \n" if index % size == 0
    end

    legend
  end

  def instructions
    "\nInstructions: Input a number and press Enter.\n\n"
  end

  def clear_screen
    system 'clear'
  end
end
