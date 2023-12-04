require "pry"
require_relative "../../lib/2023/day_03.rb"

RSpec.describe Day03 do
  before do
    @sample_input = <<~INPUT
467..114..
...*......
..35..633.
......#...
617*....10
.....+.58.
..592.....
......755.
...$.*....
.664.598..
INPUT
  end

  context "part 1" do
    it "works for the sample input" do
      expect(Day03.new(@sample_input).part_1).to eq 4361
    end

    it "works for the puzzle input" do
      expect(Day03.new.part_1).to eq 512794
    end
  end

  context "part 2" do
    it "works for the sample input" do
      expect(Day03.new(@sample_input).part_2).to eq 467835
    end

    it "works for the puzzle input" do
      expect(Day03.new.part_2).to eq 67779080
    end
  end
end
