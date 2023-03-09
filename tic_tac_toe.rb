require "./lib/board"
require "./lib/player"

class Game
  def initialize
    @board = Board.new
    @players = [Player.new("X"), Player.new("O")]
    @current_player = @players.first
  end
  
  def play
    loop do
      @board.display
      cell_num = @current_player.get_move
      if @board.empty?(cell_num)
        @board.place(@current_player.symbol, cell_num)
        if @board.win?(@current_player.symbol)
          @board.display
          puts "Player #{@current_player.symbol} wins!"
          break
        elsif @board.full?
          @board.display
          puts "The game is a tie."
          break
        else
          switch_players
        end
      else
        puts "That cell is already taken. Try again."
      end
    end
  end

  private
  
  def switch_players
    @current_player = (@current_player == @players.first) ? @players.last : @players.first
  end
end

Game.new.play

 
