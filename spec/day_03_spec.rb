require_relative "../lib/day_03"
require "pry"

RSpec.describe Day03 do
  context "part 1" do
    it "works for the sample input" do
      expect(Day03.new(">").part_1).to eq 2
      expect(Day03.new("^>v<").part_1).to eq 4
      expect(Day03.new("^v^v^v^v^v").part_1).to eq 2
    end

    it "works for the input file" do
      expect(Day03.new.part_1).to eq 2572
    end
  end

  context "part 2" do
    it "works for the sample input" do
      expect(Day03.new("2x3x4").part_2).to eq 34
      expect(Day03.new("1x1x10").part_2).to eq 14
      expect(Day03.new("2x3x4\n1x1x10").part_2).to eq 48
    end

    it "works for the input file" do
      expect(Day03.new.part_2).to eq 1795
    end
  end
end
