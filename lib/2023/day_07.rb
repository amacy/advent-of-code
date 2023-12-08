class Day07
  class HandPart1
    attr_reader :cards, :bid

    def initialize(cards, bid)
      @cards = cards.split(//)
      @bid = bid.to_i
    end

    def strength(cards=@cards)
      case cards.uniq.length
      when 1
        7 # five of a kind
      when 2
        if _count_cards(cards).values.max == 4
          6 # four of a kind
        else
          5 # full house
        end
      when 3
        if _count_cards(cards).values.max == 3
          4 # three of a kind
        else
          3 # two pair
        end
      when 4
        2 # one pair
      when 5
        1 # high card
      end
    end

    def <=>(hand)
      winner = strength <=> hand.strength

      if _tie?(winner)
        @cards.each_with_index do |card_1, index|
          card_2 = hand.cards[index]
          winner = _card_values[card_1] <=> _card_values[card_2]

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

    def _count_cards(cards)
      cards.inject({}) do |hash, card|
        hash[card] ||= 0
        hash[card] += 1
        hash
      end
    end

    def _card_values
      {
        "A" => 14, "K" => 13, "Q" => 12, "J" => 11,
        "T" => 10, "9" => 9, "8" => 8, "7" => 7,
        "6" => 6, "5" => 5, "4" => 4, "3" => 3, "2" => 2,
      }
    end
  end

  class HandPart2 < HandPart1
    def strength
      wilds = @cards.count("J")
      remaining_cards = @cards - ["J"]

      case wilds
      when 5, 0
        super
      when 4
        7 # five of a kind
      when 3
        if remaining_cards.uniq.length == 1
          7 # five of a kind
        elsif remaining_cards.uniq.length == 2
          6 # four of a kind
        end
      when 2
        if remaining_cards.uniq.length == 1
          7 # five of a kind
        elsif remaining_cards.uniq.length == 2
          6 # four of a kind
        elsif remaining_cards.uniq.length == 3
          4 # three of a kind
        end
      when 1
        if remaining_cards.uniq.length == 1
          7 # five of a kind
        elsif remaining_cards.uniq.length == 2
          if _count_cards(cards).values.max == 3
            6 # four of a kind
          else
            5 # full house
          end
        elsif remaining_cards.uniq.length == 3
          4 # three of a kind
        elsif remaining_cards.uniq.length == 4
          2 # pair
        end
      end
    end

    private

    def _card_values
      {
        "A" => 14, "K" => 13, "Q" => 12, "T" => 10,
        "9" => 9, "8" => 8, "7" => 7, "6" => 6,
        "5" => 5, "4" => 4, "3" => 3, "2" => 2, "J" => 1,
      }
    end
  end

  def initialize(input=nil)
    @input = _parse_input(input)
  end

  def part_1
    _solve(HandPart1)
  end

  def part_2
    _solve(HandPart2)
  end

  private

  def _solve(hand_klass)
    hands = @input.map do |hand, bid|
      hand_klass.new(hand, bid)
    end

    total = 0

    hands.sort.each_with_index do |hand, index|
      total += (hand.bid * (index + 1))
    end

    total
  end

  def _parse_input(input)
    input ||= File.read("config/2023/day_07.txt")

    input.split(/\n/).map do |line|
      line.strip.split(/ /)
    end
  end
end
