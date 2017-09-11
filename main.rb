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

black_pawn = board.squares[34].piece
puts "\n \npiece: #{black_pawn.piece_name}, #{black_pawn.current_position}"

# current position and new position
board.move("c4","c3")
puts "\nafter move - \npiece:  #{black_pawn.piece_name}, #{black_pawn.current_position}\n"


board.print_board