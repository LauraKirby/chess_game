require 'csv'

class Board
  attr_accessor :squares, :pieces, :piece

  def initialize(input=nil)
    @squares = create_board
    @reset = parse_input(input)
  end

  def add_piece(piece, color, board_location)
    piece_index = find_list_position(board_location)
    @squares[piece_index].piece = Piece.new(piece, color, board_location)
  end

  def remove_piece(board_location)
    piece_index = find_list_position(board_location)
    @squares[piece_index].piece = nil
  end

  def move(previous_board_location, new_board_location)
    # piece = nil
    previous_index = find_list_position(previous_board_location)
    new_index = find_list_position(new_board_location)
    new_coordinates = parse_position(new_board_location)
    previous_coordinates = parse_position(previous_board_location)

    piece = @squares[previous_index].piece

    # return 0 if piece == nil
    if piece == nil
      puts "no piece located at #{previous_board_location}"
      return 0
    end

    difference = find_distance(previous_coordinates, new_coordinates)

    # black pawn
    # forward
    # puts "piece_at_index?(new_index) #{piece_at_index?(new_index)}, new index #{new_index}"
    if (difference == [0, -1]) && !piece_at_index?(new_index)
      # puts "piece_at_index?(new_index) #{piece_at_index?(new_index)}"
      update_piece_coordinates(piece, difference)
      update_squares_pieces(piece, previous_index, new_index)
      piece.current_position
    # diagonal right
    elsif (difference == [1, -1]) && piece_at_index?(new_index)
      update_piece_coordinates(piece, difference)
      update_squares_pieces(piece, previous_index, new_index)
      piece.current_position
    # diagonal left
    elsif (difference == [-1, -1]) && piece_at_index?(new_index)
      update_piece_coordinates(piece, difference)
      update_squares_pieces(piece, previous_index, new_index)
      piece.current_position
    else
      puts "invalid move"
      return 0
    end
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

  private

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

  def find_list_position(coordinates)
    if coordinates.class == String
      coordinates = parse_position(coordinates)
      loc = 63 - (8 * coordinates[1]) + coordinates[0]
    elsif coordinates.class == Array
      loc = 63 - (8 * coordinates[1]) + coordinates[0]
    else
      return 0
    end
    loc
  end

  def parse_position(pos)
    position = pos.split("")
    @row = position[1].to_i
    @column = position[0].ord - 96
    [@column, @row]
  end

  def find_distance(previous_board_location, new_board_location)
    distance = [(  new_board_location[0] - previous_board_location[0] ), ( new_board_location[1] - previous_board_location[1])]
    distance
  end

  def update_piece_coordinates(piece, difference)
    previous_board_location = piece.current_position
    new_location = [(difference[0] + previous_board_location[0]), (difference[1] + previous_board_location[1] )]
    piece.current_position = new_location
    new_location
  end

  def update_squares_pieces(piece, new_index, previous_index)
    @squares[previous_index].piece = nil
    @squares[new_index].piece = piece
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

  def piece_at_index?(new_index)
    if @squares[new_index].piece.nil?
      return false
    elsif @squares[new_index].piece.color == "white"
      return true
    end
  end

end
