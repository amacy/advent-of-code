class Day07
  Hand = Struct.new(:_cards, :_bid) do
    CARD_VALUES = {
      "A" => 14,
      "K" => 13,
      "Q" => 12,
      "J" => 11,
      "T" => 10,
      "9" => 9,
      "8" => 8,
      "7" => 7,
      "6" => 6,
      "5" => 5,
      "4" => 4,
      "3" => 3,
      "2" => 2,
    }

    def strength
      case cards.uniq.length
      when 1
        7
      when 2
        if _count_cards.values.max == 4
          6 # four of a kind
        else
          5 # full house
        end
      when 3
        if _count_cards.values.max == 3
          4 # three of a kind
        else
          3 # two pair
        end
      when 4
        2 # one pair
      when 5
        1 # high card
      else
        raise "wtf"
      end
    end

    def bid
      _bid.to_i
    end

    def cards
      _cards.split(//)
    end

    def <=>(hand)
      winner = strength <=> hand.strength

      if _tie?(winner)
        cards.each_with_index do |card_1, index|
          card_2 = hand.cards[index]
          winner = CARD_VALUES[card_1] <=> CARD_VALUES[card_2]

          if _tie?(winner)
            next
          else
            break
          end
        end
      end

      winner
    end

    private

    def _tie?(int)
      int == 0
    end

    def _count_cards
      cards.inject({}) do |hash, card|
        hash[card] ||= 0
        hash[card] += 1
        hash
      end
    end
  end

  def initialize(input=nil)
    @input = _parse_input(input)
  end

  def part_1
    hands = @input
    total = 0

    hands.sort.each_with_index do |hand, index|
      total += (hand.bid * (index + 1))
    end

    total
  end

  def part_2
    # solve part 2
  end

  private

  def _parse_input(input)
    input ||= File.read("config/2023/day_07.txt")

    input.split(/\n/).map do |line|
      hand, bid = line.strip.split(/ /)
      Hand.new(hand, bid)
    end
  end
end
