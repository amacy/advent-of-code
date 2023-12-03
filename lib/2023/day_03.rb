class Day03
  def initialize(input=nil)
    @input = _parse_input(input)
  end

  def part_1
    top_edge_index = 0
    left_edge_index = 0
    right_edge_index = @input.first.length - 1
    bottom_edge_index = @input.length - 1

    total = 0

    @input.each_with_index do |row, row_index|
      current_number = ""

      row.each_with_index do |node, column_index|
        if node.match(/\d/) && column_index != right_edge_index
          # build the number
          current_number << node
        elsif current_number.length > 0
          if column_index == right_edge_index && node.match(/\d/)
            current_number << node
            last_empty_column_index = column_index - current_number.length
          else
            last_empty_column_index = [column_index - current_number.length - 1, 0].max
          end
          # determine if number should be included in the sum

          # determine the node left of the number

          # check the current row
          if last_empty_column_index == left_edge_index
            # check right, which is the current node
            if _contains_symbol?([node])
              total += current_number.to_i
              current_number = ""
              next
            end
          elsif column_index == right_edge_index
            # check left
            if _contains_symbol?([row[last_empty_column_index]])
              total += current_number.to_i
              current_number = ""
              next
            end
          else
            # check both
            if _contains_symbol?([node, row[last_empty_column_index]])
              total += current_number.to_i
              current_number = ""
              next
            end
          end

          case row_index
          when top_edge_index
            # check below
            if _contains_symbol?(@input[row_index + 1][last_empty_column_index..column_index])
              total += current_number.to_i
              current_number = ""
              next
            end
          when bottom_edge_index
            # check above
            if _contains_symbol?(@input[row_index - 1][last_empty_column_index..column_index])
              total += current_number.to_i
              current_number = ""
              next
            end
          else
            # check both
            if _contains_symbol?(@input[row_index + 1][last_empty_column_index..column_index]) ||
              _contains_symbol?(@input[row_index - 1][last_empty_column_index..column_index])
              total += current_number.to_i
              current_number = ""
              next
            end
          end

          current_number = ""
        end
      end
    end

    total
  end

  def part_2
    # solve part 2
  end

  private

  def _parse_input(input)
    input ||= File.read("config/2023/day_03.txt")

    input.split(/\n/).map(&:strip).map do |line|
      line.split(//)
    end
  end

  def _contains_symbol?(array)
    (array - ((0..9).to_a.map(&:to_s) + ["."])).length > 0
  end
end
