require "pry"
require_relative "../../lib/2015/day_17.rb"

RSpec.describe Day17 do
  context "part 1" do
    it "works for the sample input" do
      input = ""
      expect(Day17.new(input).part_1).to eq 0
    end

    it "works for the puzzle input" do
      expect(Day17.new.part_1).to eq 0
    end
  end

  context "part 2" do
    it "works for the sample input" do
      input = ""
      expect(Day17.new(input).part_2).to eq 0
    end

    it "works for the puzzle input" do
      expect(Day17.new.part_2).to eq 0
    end
  end
end
