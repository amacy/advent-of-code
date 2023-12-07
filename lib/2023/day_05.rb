class Day05
  def initialize(input=nil)
    @input = _parse_input(input)
  end

  def part_1
    map_queue, mappings = @input

    results = {}

    mappings.each_with_index do |(current_destination, mappings), index|
      if current_destination.nil?
        break
      elsif results.empty?
        # it's a single depth array for "seed"
        mappings.each do |val|
          results[val] = {current_destination => val}
        end
      else
        current_source = map_queue[index - 1]

        results.each do |seed, values|
          source_val = values[current_source]
          destination_val = nil

          # it's a nested array for the remainder
          mappings.each do |(destination_start, source_start, range_length)|
            if (source_start..source_start + range_length).include?(source_val)
              offset = source_val - source_start
              destination_val = destination_start + offset
              break
            end
          end

          results[seed][current_destination] = destination_val || source_val
        end
      end
    end

    results.values.map do |value|
      value[map_queue.last]
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
        mappings[current_source] = []
        map_queue << current_source
      elsif line.scan(/\d+/).map(&:to_i).length > 0
        destination_start, source_start, range_length = line.scan(/\d+/).map(&:to_i)

        mappings[current_source] << [
          destination_start,
          source_start,
          range_length,
        ]
      end
    end

    [map_queue, mappings]
  end
end
