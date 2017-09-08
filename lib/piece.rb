class Piece
  attr_accessor :piece_name, :current_position

  def initialize(piece_name, color, position)
    # @type = create_type(piece_name)
    @current_position = parse_position(position)
    @piece_name = piece_name
    @color = color
  end

  def move(location)
    new_location = parse_position(location)
    difference = find_distance(new_location)

    # black pawn
    # forward
    if difference == [0, 1]
      set_location(difference)
    # diagonal right
    elsif difference == [-1, 1]
      set_location(difference)
    # diagonal right
    elsif difference == [1, 1]
      set_location(difference)
    else
      puts "invalid move"
      return @current_position
    end
  end

  private

  def parse_position(str_position)
    position = str_position.split("")
    @row = position[1].to_i
    @column = position[0].ord - 96
    [@column, @row]
  end

  def find_distance(new_location)
    distance = [( @current_position[0] - new_location[0] ), ( @current_position[1] - new_location[1] )]
    distance
  end

  def set_location(difference)
    new_location = [ ( @current_position[0] - difference[0] ), ( @current_position[1] - difference[1] )]
    @current_position = new_location
  end
end