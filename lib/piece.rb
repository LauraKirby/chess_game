class Piece
  attr_accessor :piece_name, :color, :current_position, :row, :column

  def initialize(piece_name, color, position)
    @current_position = parse_position(position)
    @piece_name = piece_name
    @color = color
  end

  def parse_position(str_position)
    position = str_position.split("")
    @row = position[1].to_i
    @column = position[0].ord - 96
    [@column, @row]
  end

  def coordinates
    [@column, @row]
  end

end