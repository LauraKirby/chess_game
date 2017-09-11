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

  def print_board
    count = 0
    @squares.each do |square|
      square.piece.nil? ? local_piece = "e" : local_piece = square.piece.piece_name
      puts "\n \n"  if count % 8 == 0
      print " #{square.coordinates} : #{local_piece} --"
      count += 1
    end
  end

  def move(starting_location, ending_location)
    # piece = nil
    old_list_position = find_list_position(starting_location)
    piece_new_coordinates = parse_position(ending_location)
    piece_old_coordinates = parse_position(starting_location)

    piece = @squares[old_list_position].piece

    # return 0 if piece == nil
    if piece == nil
      puts "no piece located at #{starting_location}"
      return 0
    end

    difference = find_distance(starting_location, ending_location)

    # black pawn
    # forward
    if difference == [0, -1]
      update_piece_coordinates(piece, difference)
      update_squares_pieces(piece, piece_new_coordinates, piece_old_coordinates)
      piece.current_position
    # diagonal right
    elsif difference == [1, -1]
      update_piece_coordinates(piece, difference)
      update_squares_pieces(piece, piece_new_coordinates, piece_old_coordinates)
      piece.current_position
    # diagonal left
    elsif difference == [-1, -1]
      update_piece_coordinates(piece, difference)
      update_squares_pieces(piece, piece_new_coordinates, piece_old_coordinates)
      piece.current_position
    else
      puts "invalid move"
      return 0
    end
  end

  private

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

  def find_distance(starting_location, ending_location)
    starting_location = parse_position(starting_location)
    ending_location = parse_position(ending_location)
    distance = [(  ending_location[0] - starting_location[0] ), ( ending_location[1] - starting_location[1])]
    distance
  end

  def update_piece_coordinates(piece, difference)
    starting_location = piece.current_position
    new_location = [(difference[0] + starting_location[0]), (difference[1] + starting_location[1] )]
    piece.current_position = new_location
    new_location
  end

  def update_squares_pieces(piece, piece_new_coordinates, piece_old_coordinates)
    new_list_position = find_list_position(piece_new_coordinates)
    old_list_position = find_list_position(piece_old_coordinates)
    @squares[old_list_position].piece = nil
    @squares[new_list_position].piece = piece
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

end
