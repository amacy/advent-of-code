require "pry"
require_relative "../../lib/2023/day_08.rb"

RSpec.describe Day08 do
  context "part 1" do
    it "works for the sample input" do
      input_1 = <<~INPUT
RL

AAA = (BBB, CCC)
BBB = (DDD, EEE)
CCC = (ZZZ, GGG)
DDD = (DDD, DDD)
EEE = (EEE, EEE)
GGG = (GGG, GGG)
ZZZ = (ZZZ, ZZZ)
INPUT
      expect(Day08.new(input_1).part_1).to eq 2

      input_2 = <<~INPUT
LLR

AAA = (BBB, BBB)
BBB = (AAA, ZZZ)
ZZZ = (ZZZ, ZZZ)
INPUT
      expect(Day08.new(input_2).part_1).to eq 6
    end

    it "works for the puzzle input" do
      expect(Day08.new.part_1).to eq 14681
    end
  end

  context "part 2" do
    it "works for the sample input" do
      input = <<~INPUT
LR

11A = (11B, XXX)
11B = (XXX, 11Z)
11Z = (11B, XXX)
22A = (22B, XXX)
22B = (22C, 22C)
22C = (22Z, 22Z)
22Z = (22B, 22B)
XXX = (XXX, XXX)
INPUT
      expect(Day08.new(input).part_2).to eq 6
    end

    xit "works for the puzzle input" do
      expect(Day08.new.part_2).to eq 0
    end
  end
end
