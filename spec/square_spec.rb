require '_spec_helper'

describe "Square" do
  describe "#coordinates" do
    it "creates a Board with pieces" do
      square = Square.new(1,1)
      expect(square.coordinates).to eq([1,1])
    end
  end

end