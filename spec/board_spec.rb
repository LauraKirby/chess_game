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
    expect(board.squares[24].piece.class).to eq(Piece)
  end

end
