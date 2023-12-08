class Day08
  def initialize(input=nil)
    @input = _parse_input(input)
  end

  def part_1
    directions, nodes = @input
    steps = 0

    current_node = "AAA"
    loop do
      directions.each do |direction|
        index = direction == "L" ? 0 : 1
        current_node = nodes[current_node][index]
        steps += 1
        return steps if current_node == "ZZZ"
      end
    end
  end

  def part_2
    # solve part 2
  end

  private

  def _parse_input(input)
    input ||= File.read("config/2023/day_08.txt")
    directions, _, *mappings = input.split(/\n/).map(&:strip)

    nodes = mappings.inject({}) do |hash, line|
      key, value = line.split(/ = /)
      hash[key] = value.match(/(\w+), (\w+)/).captures
      hash
    end

    [directions.split(//), nodes]
  end
end
