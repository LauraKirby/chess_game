require '_spec_helper'

describe "Piece" do
  it "creates an instance of Piece" do
    piece = Piece.new("pawn", "black", "c4")
    expect(piece.piece_name).to eq("pawn")
    expect(piece.color).to eq("black")
    expect(piece.current_position).to eq([3,4])
    expect(piece.column).to eq(3)
    expect(piece.row).to eq(4)
  end

  # describe "white pawn" do
  #   it "should be able to move forward" do
  #     piece = Piece.new("pawn", "black", "b5")
  #     expect(piece.move("c4")).to eq([3,3])
  #   end

  #   it "should be able to move diagonally left if a piece is located at that position" do
  #   end

  #   it "should be able to move diagonally right if a piece is located at that position" do
  #   end
  # end

end
