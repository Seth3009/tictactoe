class Player
  attr_reader :symbol
  
  def initialize(symbol)
    @symbol = symbol
  end
  
  def get_move
    puts "Player #{symbol}, enter a cell number (1-9):"
    gets.chomp.to_i
  end
end
