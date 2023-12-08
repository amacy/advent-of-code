require "pry"
require_relative "../../lib/2023/day_07.rb"

RSpec.describe Day07 do
  before do
    @sample_input = <<~INPUT
32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483
INPUT
  end

  context "part 1" do
    it "works for the sample input" do
      expect(Day07.new(@sample_input).part_1).to eq 6440
    end

    it "works for the puzzle input" do
      expect(Day07.new.part_1).to eq 250347426
    end
  end

  context "part 2" do
    it "works for the sample input" do
      expect(Day07.new(@sample_input).part_2).to eq 5905
    end

    it "works for the puzzle input" do
      expect(Day07.new.part_2).to eq 251224870
    end
  end
end
