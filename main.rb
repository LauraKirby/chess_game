require_relative "./lib/game.rb"
require_relative "./lib/piece.rb"
require_relative "./lib/board.rb"
require_relative "./lib/square.rb"

setup = "input_file.csv"

game = Game.new(setup)
board = game.board

board.print_board

black_pawn = board.squares[34].piece
puts "\n\nbefore move, piece: #{black_pawn.piece_name}, current position: #{black_pawn.current_position}"
puts "board.move('c4,'c3')"
board.move('c4','c3')
puts "after move, piece:  #{black_pawn.piece_name}, current position: #{black_pawn.current_position}\n\n"

black_pawn_a4 = board.squares[32].piece
puts "before move, piece:  #{black_pawn_a4.piece_name}, current position: #{black_pawn_a4.current_position}\n"
puts "board.move('a4','i3')"
board.move('a4','i3')
puts "after move, piece:  #{black_pawn_a4.piece_name}, current position: #{black_pawn_a4.current_position}\n"

board.print_board