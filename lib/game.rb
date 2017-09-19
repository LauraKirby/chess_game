require_relative "./game_helper"

class Game
  include GameHelper

  attr_accessor :board, :pieces

  def initialize(pieces=nil)
    @board = Board.new(pieces)
    @pieces = nil
  end
end
