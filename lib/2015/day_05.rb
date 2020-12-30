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
      sub_array_1 = array[index + 1..-1]
      sub_array_1.each_slice(2).with_index do |slice, index|
        if _slice_contains_repeating_pair?(
            candidate,
            sub_array_1,
            slice,
            index,
            true,
        )
          return true
        end
      end

      sub_array_2 = array[index + 2..-1]
      sub_array_2.each_slice(2).with_index do |slice, index|
        if _slice_contains_repeating_pair?(
            candidate,
            sub_array_2,
            slice,
            index,
            false,
        )
          return true
        end
      end

      index += 1
    end
  end

  def _slice_contains_repeating_pair?(candidate, array, slice, index, skip_repeating_check)
    return false if candidate != slice
    return true if slice[0] != slice[1]
    return true if skip_repeating_check

    binding.pry
    array = array.each_slice(2).to_a
    if _part_of_longer_sequence?(candidate, array, index) ||
        _part_of_longer_sequence(candidate, array, array.index(slice))
      false
    else
      true
    end
  end

  def _part_of_longer_sequence?(candidate, array, index)
    neighbor_index_1 = index - 1
    if neighbor_index_1 >= 0 && candidate[0] == array[neighbor_index_1][1]
      return false
    end

    neighbor_index_2 = index + 1
    if neighbor_index_2 < array.length && candidate[0] == array[neighbor_index_2][0]
      return false
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
