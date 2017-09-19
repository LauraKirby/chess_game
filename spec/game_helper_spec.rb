require '_spec_helper'

describe "GameHelper" do
  before(:each) do
    @game = Game.new("input_file.csv")
    @board = @game.board
  end

  describe "#find_distance(piece, new_location)" do
    it "should take two values and return the distance is the form of coordinates (ie [x,y])" do
      start = @board.send(:parse_position, "c4")
      end_position =  @board.send(:parse_position, "b3")
      expect(@board.send(:find_distance, start, end_position)).to eq([-1,-1])
    end
  end

  describe "#parse_position" do
    it "should take the user's input, such at 'c4' and return the corresponding coordinates" do
      expect(@board.send(:parse_position, "c4")).to eq([3,4])
    end
  end

  describe "#update_piece_coordinates(piece, difference)" do
    it "should update the 'current_position' on a piece and the corresponding previous position of on the board and the new position on the board" do
      black_pawn = @board.squares[34].piece
      difference = [-1,-1]
      expect(@board.send(:update_piece_coordinates, black_pawn, difference)).to eq([2,3])
    end
  end

  describe "#update_squares_pieces(piece, piece_new_coordinates)" do
    it "should update the previous square 'piece' value and the new square 'piece' value" do
      black_pawn = @board.squares[34].piece
      previous_index = 34
      new_index = 41

      @board.send(:update_squares_pieces, black_pawn, new_index, previous_index)
      expect(@board.squares[new_index].piece).to eq nil
      expect(@board.squares[previous_index].piece.class).to eq Piece
    end
  end

  describe "#piece_at_index?(p_index)" do
    it "should return 'true' if a piece is in that location" do
      @board.add_piece("pawn", "white", "b3")
      p_index = @board.send(:find_list_position, "b3")
      expect(@board.send(:piece_at_index?, p_index)).to eq true
    end

    it "should return 'false' if a piece is not in that location" do
      expect(@board.send(:piece_at_index?, 0)).to eq false
    end
  end

  describe "#find_list_position" do
    it "should take a set of coordinates as user input string and return the location in the @squares array " do
      expect(@board.send(:find_list_position, "c4")).to eq(34)
    end

    it "should take a set of coordinates as an array and return the location in the @squares array " do
      expect(@board.send(:find_list_position, [3,4])).to eq(34)
    end
  end
end