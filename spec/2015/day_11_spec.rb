require "pry"
require_relative "../../lib/2015/day_11.rb"

RSpec.describe Day11 do
  context "part 1" do
    it "works for the sample input" do
      input = ""
      expect(Day11.new(input).part_1).to eq 0
    end

    it "works for the puzzle input" do
      expect(Day11.new.part_1).to eq 0
    end
  end

  context "part 2" do
    it "works for the sample input" do
      input = ""
      expect(Day11.new(input).part_2).to eq 0
    end

    it "works for the puzzle input" do
      expect(Day11.new.part_2).to eq 0
    end
  end
end
