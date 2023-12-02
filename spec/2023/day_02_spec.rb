require "pry"
require_relative "../../lib/2023/day_02.rb"

RSpec.describe Day02 do
  before do
    @sample_input = <<~INPUT
Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
INPUT
  end

  context "part 1" do
    it "works for the sample input" do
      expect(Day02.new(@sample_input).part_1).to eq 8
    end

    it "works for the puzzle input" do
      expect(Day02.new.part_1).to eq 2061
    end
  end

  context "part 2" do
    it "works for the sample input" do
      expect(Day02.new(@sample_input).part_2).to eq 2286
    end

    it "works for the puzzle input" do
      expect(Day02.new.part_2).to eq 72596
    end
  end
end
