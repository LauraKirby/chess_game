require '_spec_helper'

describe "Game" do
  before(:each) do
    @game = Game.new("input_file.csv")
    @board = @game.board
  end

  it "creates a Game" do
    game = Game.new()
    expect(game.board).to be_truthy
    expect(game.board.pieces).to be_truthy
  end
end