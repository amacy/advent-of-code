require "set"

class Day03
  def initialize(input=nil)
    @input = _parse_input(input)
  end

  def part_1
    houses = Set.new
    x = 0
    y = 0
    houses.add([x, y])

    @input.each do |movement|
      case movement
      when "^"
        y += 1
      when "v"
        y -= 1
      when ">"
        x += 1
      when "<"
        x -= 1
      end

      houses.add([x, y])
    end

    houses.count
  end

  def part_2
  end

  def _parse_input(input)
    input ||= File.read("config/day_03.txt")
    input.split("")
  end
end
