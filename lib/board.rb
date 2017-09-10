require 'csv'

class Board
  attr_accessor :squares, :pieces

  def initialize(input=nil)
    @squares = create_board
    @reset = parse_input(input)
  end

  def create_board
    new_board = []
    [*8.downto(1)].each do | row |
      (1..8).each do | column |
        new_board.push(Square.new(row, column))
      end
    end
    new_board
  end

  def parse_input(input)
    @pieces = []
    return @pieces if input.nil?

    positions = []
    CSV.foreach(input) do |row|
      row.each {|item| item.strip! }
      positions.push(row)
    end

    positions.each do |piece|
      @pieces.push( Piece.new(piece[0], piece[1], piece[2]) )
    end

    place_pieces(@pieces)
  end

  # could first sort list of pieces that way we don't have to iterate over the
  # entire board each item an piece is placed
  def place_pieces(pieces)
    return [] if pieces.nil?
    pieces.each do |piece|
      count = 0
      for i in 0..63
        if piece.current_position == @squares[i].coordinates
          @squares[i].piece = piece
          count += 1
        elsif count > pieces.length
          break pieces
        end
      end
    end
    pieces
  end

  def print_board
    count = 0
    @squares.each do |square|
      square.piece.nil? ? local_piece = "e" : local_piece = square.piece.piece_name
      puts "\n \n"  if count % 8 == 0
      print " #{square.coordinates} : #{local_piece} --"
      count += 1
    end
  end

end

