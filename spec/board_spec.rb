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

    describe "#move" do
      describe "black pawn" do
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

      describe "#find_list_position" do
        it "should take a set of coordinates as user input string and return the location in the @squares array " do
          expect(@board.find_list_position("c4")).to eq(34)
        end

        it "should take a set of coordinates as an array and return the location in the @squares array " do
          expect(@board.find_list_position([3,4])).to eq(34)
        end
      end

      describe "#parse_position" do
        it "should take the user's input, such at 'c4' and return the corresponding coordinates" do
          expect(@board.parse_position("c4")).to eq([3,4])
        end
      end

      describe "#find_distance(piece, new_location)" do
        it "should take two values and return the distance is the form of coordinates (ie [x,y])" do
          expect(@board.find_distance("c4", "b3")).to eq([-1,-1])
        end
      end

      describe "#update_piece_coordinates(piece, difference)" do
        it "should update the 'current_position' on a piece and the corresponding previous position of on the board and the new position on the board" do
          black_pawn = @board.squares[34].piece
          difference = [-1,-1]
          expect(@board.update_piece_coordinates(black_pawn, difference)).to eq([2,3])
        end
      end

      describe "#update_squares_pieces(piece, piece_new_coordinates)" do
        it "should update the previous square 'piece' value and the new square 'piece' value" do
          black_pawn = @board.squares[34].piece
          piece_new_coordinates = [2,3]
          @board.update_squares_pieces(black_pawn, piece_new_coordinates)
          expect(@board.squares[34].piece).to eq nil
          expect(@board.squares[41].piece.current_position).to eq [2,3]
          # expect(@board.squares[41].piece.current_position).to eq [2,3]
        end
      end

    end

  end
end
