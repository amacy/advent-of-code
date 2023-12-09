class Day09
  def initialize(input=nil)
    @input = _parse_input(input)
  end

  def part_1
    histories = @input

    results = []
    histories.each_with_index do |history, history_index|
      results[history_index] = [history]
      loop do
        results[history_index] << []

        values = results[history_index][-2]
        values.each_with_index do |value, value_index|
          next if value_index == 0
          results[history_index].last << value - values[value_index - 1]
        end

        if results[history_index].last.uniq == [0]
          break
        end
      end
    end

    results.each do |history|
      reversed = history.reverse
      reversed.each_with_index do |history_line, row_index|
        if history_line[-1] == 0
          history_line << 0
        else
          history_line << history_line[-1] + reversed[row_index - 1][-1]
        end
      end
    end

    results.inject(0) do |sum, history|
      sum += history[0][-1]
    end
  end

  def part_2
    # solve part 2
  end

  private

  def _parse_input(input)
    input ||= File.read("config/2023/day_09.txt")
    input.split(/\n/).map do |line|
      line.split(/ /).map(&:to_i)
    end
  end
end
