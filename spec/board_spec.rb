# add constants for strings
# create error messages
# create unique methods (eg valid moves) within subclass
# make class for each piece, each piece will then have its own "valid move method"
require '_spec_helper'
require 'csv'

describe "Board" do
  it "creates an empty Board" do
    board = Board.new()
    expect(board.squares.length).to eq(64)
    expect(board.pieces).to match_array([])
  end

  it "creates a Board with squares" do
    board = Board.new()
    expect(board.squares[0].class).to eq(Square)
    expect(board.squares.length).to eq(64)
  end


  describe "board with pieces" do
    before(:each) do
      @board = Board.new("input_file.csv")
    end

    it "creates a Board with pieces" do
      expect(@board.squares[34].piece.class).to eq(Piece)
    end
  end

  describe "#add_piece" do
    it "adds a piece to the board" do
      @board = Board.new("input_file.csv")
      @board.add_piece("pawn", "black", "c3")
      piece_index = @board.send(:find_list_position, "c3")
      expect(@board.squares[piece_index].piece.class).to eq(Piece)
    end
  end

  describe "#remove_piece" do
    it "should take the board location and set the square's piece attribute to nil" do
      @board = Board.new("input_file.csv")
      @board.add_piece("pawn", "white", "b3")
      @board.remove_piece("b3")
      piece_index = @board.send(:find_list_position, "b3")
      expect(@board.squares[piece_index].piece.nil?).to eq(true)
    end
  end

  describe "#move" do
    before(:each) do
      @board = Board.new("input_file.csv")
    end

    describe "black pawn" do
      describe "no piece is located at new position" do
        it "should be able to move forward" do
          expect(@board.move("c4", "c3")).to eq([3, 3])
        end

        it "should not be able to move diagonally right" do
          @board.remove_piece("d3")
          expect(@board.move("c4", "d3")).to eq(0)
        end

        it "should not be able to move diagonally left" do
          @board.remove_piece("b3")
          expect(@board.move("c4", "b3")).to eq(0)
        end
      end

      describe "white piece is located at new position" do
        it "should be able to move diagonally left" do
          @board.add_piece("pawn", "white", "b3")
          expect(@board.move("c4", "b3")).to eq([2, 3])
        end

        it "should be able to move diagonally right" do
          @board.add_piece("pawn", "white", "d3")
          expect(@board.move("c4", "d3")).to eq([4, 3])
        end

        it "should not be able to move forward" do
          @board.add_piece("pawn", "white", "c3")
          expect(@board.move("c4", "c3")).to eq(0)
        end
      end

      describe "black piece is located at new position" do
        it "should not be able to move diagonally left" do
          @board.add_piece("pawn", "black", "d3")
          expect(@board.move("c4", "d3")).to eq(0)
        end

        it "should not be able to move diagonally right" do
          @board.add_piece("pawn", "black", "d3")
          expect(@board.move("c4", "d3")).to eq(0)
        end

        it "should not be able to move forward" do
          @board.add_piece("pawn", "black", "c3")
          @board.move("c4", "c3")
          expect(@board.move("c4", "c3")).to eq(0)
        end
      end
    end

  end

end
