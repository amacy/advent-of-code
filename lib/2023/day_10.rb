class Day10
  MAPPING_BY_PIPE = {
    "S" => %w(n s e w),
    "|" => %w(n s),
    "-" => %w(e w),
    "L" => %w(n e),
    "J" => %w(n w),
    "7" => %w(s w),
    "F" => %w(s e),
  }

  MAPPING_BY_DIRECION = {
    "n" => %w(S | 7 F),
    "s" => %w(S | L J),
    "e" => %w(S - J 7),
    "w" => %w(S - L F),
  }

  def initialize(input=nil)
    @input = _parse_input(input)
  end

  def part_1
    starting_coords = nil
    starting_pipe = "S"
    @input.each_with_index do |row, row_index|
      row.each_with_index do |node, column_index|
        if node == starting_pipe
          starting_coords = [column_index, row_index]
          break
        end
      end
      break if starting_coords
    end

    paths = []
    loop do
      if pipes.empty?
        pipe = starting_pipe
        candidates = MAPPING[pipe]
        neighbors = _find_neighbors(starting_coords)
      else
        # find neighbors N times
      end
    end
  end

  def _find_neighbors(coords)
    column_index, row_index = coords
    node_above = @input[row_index + 1][column_index]
    node_below = @input[row_index - 1][column_index]
    node_left = @input[row_index][column_index - 1]
    node_right = @input[row_index][column_index + 1]
  end

  def part_2
    # solve part 2
  end

  private

  def _parse_input(input)
    input ||= File.read("config/2023/day_10.txt")
    input.split(/\n/).map do |line|
      line.split(//)
    end
  end
end
