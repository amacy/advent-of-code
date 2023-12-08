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
    directions, nodes = @input
    steps = 0

    current_nodes = nodes.keys.select do |node|
      node[-1] == "A"
    end

    loop do
      directions.each do |direction|
        index = direction == "L" ? 0 : 1
        end_counter = 0
        current_nodes = current_nodes.dup.map do |node|
          n = nodes[node][index]
          end_counter += 1 if n[-1] == "Z"
          n
        end
        steps += 1
        puts end_counter if end_counter > 2
        return steps if end_counter == current_nodes.length
      end
    end
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
