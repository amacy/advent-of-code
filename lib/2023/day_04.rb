class Day04
  def initialize(input=nil)
    @input = _parse_input(input)
  end

  def part_1
    total = 0

    _solve do |matches, _|

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
    counts = {}

    @input.length.times do |n|
      counts[n + 1] = 1
    end

    _solve do |matches, index|
      card = index + 1

      matches.length.times do |n|
        break if counts[card + n + 1].nil?
        counts[card + n + 1] += counts[card]
      end
    end

    counts.values.sum
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

  def _solve(&block)
    @input.each_with_index do |(winners, actuals), index|
      matches = []

      actuals.each do |n|
        if winners.include?(n)
          matches << n
        end
      end

      block.call(matches, index)
    end
  end
end
