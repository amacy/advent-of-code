require "pry"
require_relative "../../lib/2023/day_05.rb"

RSpec.describe Day05 do
  before do
    @sample_input = <<~INPUT
seeds: 79 14 55 13

seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4
INPUT
  end

  context "part 1" do
    it "works for the sample input" do
      expect(Day05.new(@sample_input).part_1).to eq 35
    end

    it "works for the puzzle input" do
      expect(Day05.new.part_1).to eq 331445006
    end
  end

  context "part 2" do
    it "works for the sample input" do
      expect(Day05.new(@sample_input).part_2).to eq 0
    end

    it "works for the puzzle input" do
      expect(Day05.new.part_2).to eq 0
    end
  end
end
