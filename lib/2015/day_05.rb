class Day05
  def initialize(input=nil)
    @input = _parse_input(input)
  end

  def part_1
    @input.select do |string|
      %w(a e i o u).map { |vowel| string.count(vowel) }.sum >= 3 &&
        string.match(/(ab|cd|pq|xy)/).nil? &&
        !_contains_consecutive_values?(string)
    end.count
  end

  def part_2
    @input.select do |string|
      array = string.split("")
      _contains_repeat_separated_by_one_letter?(array) &&
        _contains_repeating_pair?(array)
    end.count
  end

  def _contains_repeating_pair?(array)
    index = 1

    loop do
      return false if array[index + 1..-1].empty?

      candidate = array[index - 1..index]
      array[index + 1..-1].each_slice(2) do |s|
        return true if candidate == s
      end

      array[index + 2..-1].each_slice(2) do |s|
        return true if candidate == s
      end

      index += 1
    end
  end

  def _contains_repeat_separated_by_one_letter?(array)
    array.each_slice(3) do |s|
      return true if s[0] == s[2]
    end

    array[1..-1].each_slice(3) do |s|
      return true if s[0] == s[2]
    end
    false
  end

  def _contains_consecutive_values?(string)
    array = string.split("")
    array.each_slice(2) do |s|
      return false if s[0] == s[1]
    end

    array[1..-1].each_slice(2) do |s|
      return false if s[0] == s[1]
    end
    true
  end

  def _parse_input(input)
    input ||= File.read("config/2015/day_05.txt")
    input.split("\n")
  end
end
