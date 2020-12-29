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

  def part_2
    current_floor = 0

    @input.each_with_index do |instruction, index|
      case instruction
      when "("
        current_floor += 1
      when ")"
        current_floor -= 1
      end

      if current_floor == -1
        return index + 1
      end
    end

    raise "never makes it to the basement"
  end

  def _parse_input(input)
    input ||= File.read("config/day_01.txt")
    input.split("")
  end
end
