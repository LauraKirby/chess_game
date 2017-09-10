require '_spec_helper'

describe "Piece" do
  it "creates an instance of Piece" do
    piece = Piece.new("pawn", "black", "c4")
    expect(piece.piece_name).to eq("pawn")
    expect(piece.current_position).to eq([3,4])
  end
end
