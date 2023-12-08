class Day06
  def initialize(input=nil)
    @input = _parse_input(input)
  end

  def part_1
    times, distances = @input
    times = times.map(&:to_i)
    distances = distances.map(&:to_i)

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
    times, distances = @input
    race_time = times.join.to_i
    distance_record = distances.join.to_i

    winners = 0
    (1..race_time - 1).each do |hold_time|
      movement_time = race_time - hold_time
      distance_traveled = movement_time * hold_time
      if distance_traveled > distance_record
        winners += 1
      end
    end

    winners
  end

  private

  def _parse_input(input)
    input ||= File.read("config/2023/day_06.txt")
    input.split(/\n/).map do |line|
      line.strip.scan(/\d+/)
    end
  end
end
