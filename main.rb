# read file
# create Pieces
# convert position to something that can be represented on x & y coordinates
# add ability for pawn to move
  # [x, y] = [column, row]
  # white: move forward [x, y] + [0, 1]
  # white: move diagonally
    # condition: if there is a piece in diagonal position
    # diagonal left: [x, y] + [-1, 1]
    # diagonal right: [x, y] + [1, 1]

  # [x, y] = [column, row]
  # black: move forward [x, y] + [0, -1]
  # black: move diagonally
    # condition: if there is a piece in diagonal position
    # diagonal left: [x, y] + [-1, -1]
    # diagonal right: [x, y] + [-1, 1]

  # cannot move back or horizontally
  # cannot move forward if piece is in that position

# add ability for king to move
require_relative "./lib/piece.rb"
require_relative "./lib/board.rb"
require_relative "./lib/square.rb"

pieces = "input_file.csv"
board = Board.new(pieces)

board.print_board

black_pawn = board.squares[26].piece
puts "\n \n black_pawn: #{black_pawn.current_position}"
# coord [3, 4]

black_pawn.move("c3")
puts "\n after move, black_pawn: #{black_pawn.current_position}\n"
