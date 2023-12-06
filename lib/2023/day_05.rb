class Day05
  def initialize(input=nil)
    @input = _parse_input(input)
  end

  def part_1
    map_queue, mappings = @input

    results = {}

    mappings.each_with_index do |(current_destination, values), index|
      if current_destination.nil?
        break
      elsif results.empty?
        values.each do |val|
          results[val] = {current_destination => val}
        end
      else
        current_source = map_queue[index - 1]

        results.each do |seed, values|
          source_val = values[current_source]
          destination_val = mappings[current_destination][source_val] ||
            source_val
          results[seed][current_destination] = destination_val
        end
      end
    end

    results.values.map do |values|
      values[map_queue.last]
    end.min
  end

  def part_2
    # solve part 2
  end

  private

  def _parse_input(input)
    input ||= File.read("config/2023/day_05.txt")
    lines = input.split(/\n/).map(&:strip)

    mappings = {"seed" => lines[0].scan(/\d+/).map(&:to_i)}
    current_source = "seed"
    map_queue = [current_source]

    lines[2..-1].each do |line|
      if match = line.match(/^#{current_source}-to-(\w+) map:$/)
        current_source = match.captures.first
        mappings[current_source] = {}
        map_queue << current_source
      elsif line.scan(/\d+/).map(&:to_i).length > 0
        destination_start, source_start, range_length = line.scan(/\d+/).map(&:to_i)

        source_ns = source_start..source_start + range_length
        destination_ns = (destination_start..destination_start + range_length).to_a

        source_ns.each_with_index do |source_n, index|
          mappings[current_source][source_n] = destination_ns[index]
        end
      end
    end

    [map_queue, mappings]
  end
end
