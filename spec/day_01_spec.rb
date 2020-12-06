require_relative "../lib/day_02"
require "pry"

RSpec.describe Day02 do
  context "part 1" do
    it "works for the sample input" do
      expect(Day02.new("2x3x4").part_1).to eq 58
      expect(Day02.new("1x1x10").part_1).to eq 43
      expect(Day02.new("2x3x4\n1x1x10").part_1).to eq 101
    end

    it "works for the input file" do
      expect(Day02.new.part_1).to eq 1598415
    end
  end

  context "part 2" do
    it "works for the sample input" do
      expect(Day02.new(")").part_2).to eq 1
      expect(Day02.new("()())").part_2).to eq 5
    end

    it "works for the input file" do
      expect(Day02.new.part_2).to eq 1795
    end
  end
end
