require_relative "./board"

class Square < Board
  attr_accessor :piece, :row, :column

  def initialize(row, column, piece=nil)
    @row = row
    @column = column
    @piece = piece
  end

  def coordinates
    [@column, @row]
  end
end