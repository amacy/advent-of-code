class Day02
  LIMITS = {
    "red" => 12,
    "green" => 13,
    "blue" => 14,
  }

  def initialize(input=nil)
    @input = _parse_input(input)
  end

  def part_1
    total = 0

    @input.each do |game|
      colors_under_max = 0
      game[1].each do |color, count|
        if count <= LIMITS[color]
          colors_under_max += 1
        end
      end
      if colors_under_max == LIMITS.length
        total += game[0]
      end
    end

    total
  end

  def part_2
    total = 0

    @input.each do |game|
      game_total = 1
      game[1].values.each do |count|
        game_total *= count
      end
      total += game_total
    end

    total
  end

  private

  def _parse_input(input)
    input ||= File.read("config/2023/day_02.txt")

    input.split(/\n/).inject({}) do |hash, line|
      game_id, remainder = line.match(/Game (\d+): (.*)/).captures

      cubes = {}
      remainder.split("; ").each do |set|
        set.split(", ").each do |cube_str|
          count, color = cube_str.split(" ")
          cubes[color] ||= 0
          cubes[color] = [count.to_i, cubes[color]].max
        end
      end

      hash[game_id.to_i] = cubes
      hash
    end
  end
end
