require "digest"

class Day04
  def initialize(input="yzbqklnj")
    @input = input
  end

  def part_1(zeroes=5)
    n_1 = 10 ** (@input.length - 1)
    n_2 = 10 ** @input.length
    (1..n_2).each do |n|
      if Digest::MD5.hexdigest("#{@input}#{n}")[0..zeroes - 1] == "0" * zeroes
        return n
      end
    end
  end

  def part_2
    part_1(6)
  end
end
