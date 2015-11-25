require "pry-byebug"
require_relative "game"
require_relative "win_checker"
require_relative "flatten_win_checker"

# Create game
win_checker = WinChecker.new()
flatten_win_checker = FlattenWinChecker.new()
game = Game.new(flatten_win_checker)

# Place piece
# game.place_piece(0,0)
# game.place_piece(0,1)
# game.place_piece(0,2)
# game.place_piece(1,0)
# game.place_piece(1,2)
# game.place_piece(2,0)
# game.place_piece(2,1)
# game.turn(1,1)

# piece = :o
game.turn(0,0)
game.turn(2,0)
game.turn(1,1)
game.turn(1,2)
# game.display_board
# puts "checking if game is won expect true: #{game.has_won?(piece)}"



# #TODO Roate the starting piece
# #TODO Automatically reset the board is full and tell us it's a draw
# #TODO 

binding.pry;''