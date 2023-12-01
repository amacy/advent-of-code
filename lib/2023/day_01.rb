require "set"

class Day01
  MAPPING = {
    "one" => "1",
    "two" => "2",
    "three" => "3",
    "four" => "4",
    "five" => "5",
    "six" => "6",
    "seven" => "7",
    "eight" => "8",
    "nine" => "9",
  }


  def initialize(input=nil)
    @input = _parse_input(input)
  end

  def part_1
    total = 0
    @input.each do |line|
      digits = line.scan(/\d/)
      total += (digits[0] + digits[-1]).to_i
    end
    total
  end

  def part_2
    total = 0
    @input.each do |line|
      matches = line.scan(/\d|#{MAPPING.keys.join("|")}/)
      if matches[0].match(/\d/)
        n_1 = matches[0]
      else
        string = matches[0].scan(/#{MAPPING.keys.join("|")}/).first
        n_1 = MAPPING[string]
      end

      if matches[-1].match(/\d/)
        n_2 = matches[-1]
      else
        string = matches[-1].scan(/#{MAPPING.keys.join("|")}/).first
        n_2 = MAPPING[string]
      end

      total += [n_1, n_2].join.to_i
    end
    total
  end

  private

  def _parse_input(input)
    input ||= File.read("config/2023/day_01.txt")
    input.split(/\n/)
  end
end
