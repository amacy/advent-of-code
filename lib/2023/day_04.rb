class Day04
  def initialize(input=nil)
    @input = _parse_input(input)
  end

  def part_1
    total = 0

    @input.each do |winners, actuals|
      matches = []

      actuals.each do |n|
        if winners.include?(n)
          matches << n
        end
      end

      points = nil
      matches.length.times do
        if points
          points *= 2
        else
          points = 1
        end
      end

      total += points if points
    end

    total
  end

  def part_2
    # solve part 2
  end

  private

  def _parse_input(input)
    input ||= File.read("config/2023/day_04.txt")
    input.split(/\n/).map do |line|
      line.strip.split(/:/)[1].split(/ \| /).map do |section|
        section.split(" ").map(&:to_i)
      end
    end
  end
end
