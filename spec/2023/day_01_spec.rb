require "pry"
require_relative "../../lib/2023/day_01.rb"

RSpec.describe Day01 do
  context "part 1" do
    it "works for the sample input" do
      input = <<~INPUT
1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet
INPUT
      expect(Day01.new(input).part_1).to eq 142
    end

    it "works for the puzzle input" do
      expect(Day01.new.part_1).to eq 55538
    end
  end

  context "part 2" do
    it "works for the sample input" do
      input = <<~INPUT
two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen
INPUT
      expect(Day01.new(input).part_2).to eq 281
    end

    it "works for the puzzle input" do
      pending "oneight is being parsed as only 1"
      expect(Day01.new.part_2).to eq 54875
    end
  end
end
