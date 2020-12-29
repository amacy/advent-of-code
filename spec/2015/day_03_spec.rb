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
      expect(Day03.new("^v").part_2).to eq 3
      expect(Day03.new("^>v<").part_2).to eq 3
      expect(Day03.new("^v^v^v^v^v").part_2).to eq 11
    end

    it "works for the input file" do
      expect(Day03.new.part_2).to eq 2631
    end
  end
end
