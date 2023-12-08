require "pry"
require_relative "../../lib/2023/day_06.rb"

RSpec.describe Day06 do
  before do
    @sample_input = <<~INPUT
Time:      7  15   30
Distance:  9  40  200
INPUT
  end

  context "part 1" do
    it "works for the sample input" do
      expect(Day06.new(@sample_input).part_1).to eq 288
    end

    it "works for the puzzle input" do
      expect(Day06.new.part_1).to eq 449550
    end
  end

  context "part 2" do
    it "works for the sample input" do
      expect(Day06.new(@sample_input).part_2).to eq 0
    end

    it "works for the puzzle input" do
      expect(Day06.new.part_2).to eq 0
    end
  end
end
