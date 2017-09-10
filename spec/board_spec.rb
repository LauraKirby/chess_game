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

  it "creates a Board with pieces" do
    board = Board.new("input_file.csv")
    expect(board.squares[34].piece.class).to eq(Piece)
  end

  describe "#move" do
    describe "black pawn" do
      before(:each) do
        @board = Board.new("input_file.csv")
      end

      describe "no piece is located at new position" do
        it "should be able to move forward" do
          expect(@board.move("c4", "c3")).to eq([3, 3])
        end

        # it "should not be able to move diagonally right" do
        #   expect(@piece.move("d3")).to eq("invalid move")
        #   expect(@piece.current_position).to eq([3,4])
        # end

        # it "should not be able to move diagonally left" do
        #   expect(@piece.move("d3")).to eq("invalid move")
        #   expect(@piece.current_position).to eq([3,4])
        # end
      end

      describe "white piece is located at new position" do
        it "should be able to move diagonally left" do
          expect(@board.move("c4", "b3")).to eq([2, 3])
        end

        it "should be able to move diagonally right" do
          expect(@board.move("c4", "d3")).to eq([4, 3])
        end

        # it "should not be able to move forward" do
        #   Piece.new("pawn", "black", "c3")
        #   @piece.move("c3")
        #   expect(@piece.current_position).to eq([3,4])
        # end
      end

      # describe "black piece is located at new position" do
      #   it "should not be able to move diagonally left" do
      #     Piece.new("pawn", "black", "d3")
      #     expect(@piece.move("d3")).to eq("invalid move")
      #     expect(@piece.current_position).to eq([3,4])
      #   end

      #   it "should not be able to move diagonally right" do
      #     Piece.new("pawn", "black", "d3")
      #     expect(@piece.move("d3")).to eq("invalid move")
      #     expect(@piece.current_position).to eq([3,4])
      #   end

      #   it "should not be able to move forward" do
      #     Piece.new("pawn", "black", "c3")
      #     @piece.move("c3")
      #     expect(@piece.current_position).to eq([3,4])
      #   end
      # end
    end

  end
end
