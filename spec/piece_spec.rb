require '_spec_helper'

describe "Piece" do
  it "creates an instance of Piece" do
    piece = Piece.new("pawn", "black", "c4")
    expect(piece.piece_name).to eq("pawn")
    expect(piece.current_position).to eq([3,4])
  end

  describe "#move" do
    describe "black pawn" do
      before(:each) do
        @piece = Piece.new("pawn", "black", "c4")
      end

      describe "no piece is located at new position" do
        it "should be able to move forward" do
          @piece.move("c3")
          expect(@piece.current_position).to eq([3,3])
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
          @piece.move("b3")
          expect(@piece.current_position).to eq([2,3])
        end

        it "should be able to move diagonally right" do
          @piece.move("d3")
          expect(@piece.current_position).to eq([4,3])
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
