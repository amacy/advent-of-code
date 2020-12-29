require "pry"
require_relative "../../lib/2015/day_05.rb"

RSpec.describe Day05 do
  context "part 1" do
    it "works for the sample input" do
      input_1 = "ugknbfddgicrmopn"
      expect(Day05.new(input_1).part_1).to eq 1

      input_2 = "aaa"
      expect(Day05.new(input_2).part_1).to eq 1

      input_3 = "jchzalrnumimnmhp"
      expect(Day05.new(input_3).part_1).to eq 0

      input_4 = "haegwjzuvuyypxyu"
      expect(Day05.new(input_4).part_1).to eq 0

      input_5 = "dvszwmarrgswjxmb"
      expect(Day05.new(input_5).part_1).to eq 0
    end

    it "works for the puzzle input" do
      expect(Day05.new.part_1).to eq 238
    end
  end

  context "part 2" do
    it "works for the sample input" do
      input_1 = "qjhvhtzxzqqjkmpb"
      expect(Day05.new(input_1).part_2).to eq 1

      input_2 = "xxyxx"
      expect(Day05.new(input_2).part_2).to eq 1

      input_3 = "uurcxstgmygtbstg"
      expect(Day05.new(input_3).part_2).to eq 0

      input_4 = "ieodomkazucvgmuy"
      expect(Day05.new(input_4).part_2).to eq 0
    end

    it "works for the puzzle input" do
      # 53 is incorrect
      expect(Day05.new.part_2).to eq 0
    end
  end
end
