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
    houses = Set.new
    santa_x = 0
    santa_y = 0
    robo_x = 0
    robo_y = 0
    houses.add([santa_x, santa_y])

    @input.each_slice(2) do |movements|
      santa_x, santa_y = _move(movements[0], santa_x, santa_y)
      houses.add([santa_x, santa_y])

      robo_x, robo_y = _move(movements[1], robo_x, robo_y)
      houses.add([robo_x, robo_y])
    end

    houses.count
  end

  def _move(movement, x, y)
    x = x.dup
    y = y.dup
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

    [x, y]
  end

  def _parse_input(input)
    input ||= File.read("config/day_03.txt")
    input.split("")
  end
end
