class Day06
  def initialize(input=nil)
    @input = _parse_input(input)
  end

  def part_1
    times, distances = @input

    times_to_distance = {}
    times.each_with_index do |time, index|
      times_to_distance[time] = distances[index]
    end

    times_to_winners = {}
    (1..times.max - 1).each do |hold_time|
      times_to_distance.each do |race_time, distance_record|
        movement_time = race_time - hold_time
        distance_traveled = movement_time * hold_time
        if distance_traveled > distance_record
          times_to_winners[race_time] ||= 0
          times_to_winners[race_time] += 1
        end
      end
    end

    times_to_winners.values.inject(&:*)
  end

  def part_2
    # solve part 2
  end

  private

  def _parse_input(input)
    input ||= File.read("config/2023/day_06.txt")
    input.split(/\n/).map do |line|
      line.strip.scan(/\d+/).map(&:to_i)
    end
  end
end
