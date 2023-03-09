class Board
  def initialize
    @cells = Array.new(3) { Array.new(3) { " " } }
    @numbered_cells = (1..9).to_a.map(&:to_s)
  end

  def display
    puts ""
    puts "  TIC ☻ TAC ☻ TOE  "
    puts "___________________"
    puts "|     |     |     |"
    puts "|  #{@numbered_cells[0]}  |  #{@numbered_cells[1]}  |  #{@numbered_cells[2]}  |"
    puts "|_____|_____|_____|"
    puts "|     |     |     |"
    puts "|  #{@numbered_cells[3]}  |  #{@numbered_cells[4]}  |  #{@numbered_cells[5]}  |"
    puts "|_____|_____|_____|"
    puts "|     |     |     |"
    puts "|  #{@numbered_cells[6]}  |  #{@numbered_cells[7]}  |  #{@numbered_cells[8]}  |"
    puts "|_____|_____|_____|"
    puts ""
  end

  def place(symbol, cell_num)
    @numbered_cells[cell_num - 1] = symbol
  end

  def empty?(cell_num)
    @numbered_cells[cell_num - 1] == cell_num.to_s
  end

  def win?(symbol)
    win_patterns = @numbered_cells.each_slice(3).to_a +
                   @numbered_cells.each_slice(3).to_a.transpose +
                   diagonals
    win_patterns.any? { |row| row.all? { |cell| cell == symbol } }
  end

  def full?
    @numbered_cells.none? { |cell| cell =~ /\d/ }
  end

  private

  def diagonals
    [[@numbered_cells[0], @numbered_cells[4], @numbered_cells[8]],
     [@numbered_cells[2], @numbered_cells[4], @numbered_cells[6]]]
  end
end
