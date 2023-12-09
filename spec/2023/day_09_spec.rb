require "pry"
require_relative "../../lib/2023/day_09.rb"

RSpec.describe Day09 do
  context "part 1" do
    it "works for the sample input" do
      input = <<~INPUT
0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45
INPUT
      expect(Day09.new(input).part_1).to eq 114
    end

    it "works for input begins negative and goes positive" do
      input = "-3 -1 1 3 5 7 9 11 13 15 17 19 21 23 25 27 29 31 33 35 37"
      expect(Day09.new(input).part_1).to eq 39
    end

    it "works for input begins positive and goes negative" do
      input = "9 6 3 0 -3 -6 -9 -12 -15 -18 -21 -24 -27 -30 -33 -36 -39 -42 -45 -48 -51"
      expect(Day09.new(input).part_1).to eq -54
    end

    it "works for the puzzle input" do
      # < 1930746034
      expect(Day09.new.part_1).to eq 0
    end
  end

  context "part 2" do
    it "works for the sample input" do
      input = ""
      expect(Day09.new(input).part_2).to eq 0
    end

    it "works for the puzzle input" do
      expect(Day09.new.part_2).to eq 0
    end
  end
end
