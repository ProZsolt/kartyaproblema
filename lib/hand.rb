require_relative 'card.rb'

module CardProblem
  class Hand
    NAME_OF_RANK = {
      0 => 'High Card',
      1 => 'Pair',
      2 => 'Two Pairs',
      3 => 'Three of a Kind',
      4 => 'Straight',
      5 => 'Flush',
      6 => 'Full House',
      7 => 'Four of a kind',
      8 => 'Straight flush'
    }.freeze

    def initialize(cards)
      @cards = cards.map { |c| Card.new(c) }
    end

    def rank
      NAME_OF_RANK[value.first]
    end

    def value
      if straight_flush?
        [8]
      elsif four_of_a_kind?
        [7]
      elsif full_house?
        [6]
      elsif flush?
        [5]
      elsif straight?
        [4]
      elsif three_of_a_kind?
        [3]
      elsif two_pair?
        [2]
      elsif pair?
        [1]
      else
        [0]
      end
    end

    def <=>(other)
      value.first <=> other.value.first
    end

    private

    def pair?
      @cards.group_by(&:value).values.any? { |e| e.size == 2 }
    end

    def two_pair?
      @cards.group_by(&:value).values.filter { |e| e.size == 2 }.size == 2
    end

    def three_of_a_kind?
      @cards.group_by(&:value).values.any? { |e| e.size == 3 }
    end

    def straight?
      @cards.map(&:value).sort.each_cons(2).all? { |a, b| b == a + 1 }
    end

    def flush?
      @cards.group_by(&:suit).size == 1
    end

    def full_house?
      pair? && three_of_a_kind?
    end

    def four_of_a_kind?
      @cards.group_by(&:value).values.any? { |e| e.size == 4 }
    end

    def straight_flush?
      straight? && flush?
    end
  end
end
