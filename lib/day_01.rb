class Day01
  def initialize(input=nil)
    @input = _parse_input(input)
  end

  def part_1
    current_floor = 0

    @input.each do |instruction|
      case instruction
      when "("
        current_floor += 1
      when ")"
        current_floor -= 1
      end
    end

    current_floor
  end

  def _parse_input(input)
    input ||= File.read("config/day_01.txt")
    input.split("")
  end
end
