module GameHelper

  def find_distance(previous_board_location, new_board_location)
    distance = [(  new_board_location[0] - previous_board_location[0] ), ( new_board_location[1] - previous_board_location[1])]
    distance
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

  def parse_position(pos)
    position = pos.split("")
    @row = position[1].to_i
    @column = position[0].ord - 96
    [@column, @row]
  end

  def piece_at_index?(new_index)
    if @squares[new_index].piece.nil?
      return false
    else
      return true
    end
  end

  def piece_at_index(new_index)
    if @squares[new_index].piece.nil?
      return false
    else
      return @squares[new_index].piece
    end
  end

  def update_piece_coordinates(piece, difference)
    previous_board_location = piece.current_position
    new_location = [(difference[0] + previous_board_location[0]), (difference[1] + previous_board_location[1] )]
    piece.current_position = new_location
  end

  def update_squares_pieces(piece, new_index, previous_index)
    @squares[new_index].piece = nil
    @squares[previous_index].piece = piece
  end
end