require_relative "../lib/day_01"
require "pry"

RSpec.describe Day01 do
  context "part 1" do
    it "works for the sample input" do
      expect(Day01.new("(())").part_1).to eq 0
      expect(Day01.new("()()").part_1).to eq 0

      expect(Day01.new("(((").part_1).to eq 3
      expect(Day01.new("(()(()(").part_1).to eq 3
      expect(Day01.new("))(((((").part_1).to eq 3

      expect(Day01.new("())").part_1).to eq -1
      expect(Day01.new("))(").part_1).to eq -1

      expect(Day01.new(")))").part_1).to eq -3
      expect(Day01.new(")())())").part_1).to eq -3
    end
  end

  context "part 2" do
    it "works for the input file" do
      expect(Day01.new.part_1).to eq 74
    end
  end
end
