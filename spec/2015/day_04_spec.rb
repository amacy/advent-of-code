require_relative "../lib/day_04"
require "pry"

RSpec.describe Day04 do
  context "part 1" do
    it "works for the sample input" do
      expect(Day04.new("abcdef").part_1).to eq 609043
      expect(Day04.new("pqrstuv").part_1).to eq 1048970
    end

    it "works for the puzzle input" do
      expect(Day04.new.part_1).to eq 282749
    end
  end

  context "part 2" do
    it "works for the puzzle input" do
      expect(Day04.new.part_2).to eq 9962624
    end
  end
end
