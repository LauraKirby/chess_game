require_relative "./board"

class Piece < Board
  attr_accessor :piece_name, :current_position

  def initialize(piece_name, color, position)
    @current_position = parse_position(position)
    @piece_name = piece_name
    @color = color
  end

end