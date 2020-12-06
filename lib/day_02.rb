class Day02
  def initialize(input=nil)
    @input = _parse_input(input)
  end

  def part_1
    @input.inject(0) do |total_feet, dimensions|
      l, w, h = dimensions
      sides = [
        l * w,
        w * h,
        h * l,
      ]
      total_feet += sides.inject(0) { |feet, side| feet += side * 2 } + sides.min
    end
  end

  def part_2
    @input.inject(0) do |total_feet, dimensions|
      total_feet += dimensions.min(2).sum * 2 + dimensions.inject(&:*)
    end
  end

  def _parse_input(input)
    input ||= File.read("config/day_02.txt")
    input.split("\n").map do |dimensions|
      dimensions.split("x").map(&:to_i)
    end
  end
end
