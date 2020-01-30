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
        value_of_straight_flush
      elsif four_of_a_kind?
        value_of_four_of_a_kind
      elsif full_house?
        value_of_full_house
      elsif flush?
        value_of_flush
      elsif straight?
        value_of_straight
      elsif three_of_a_kind?
        value_of_three_of_a_kind
      elsif two_pair?
        value_of_two_pair
      elsif pair?
        value_of_pair
      else
        value_of_high_card
      end
    end

    def <=>(other)
      value.zip(other.value).each do |e|
        return 1 if e[0] > e[1]
        return -1 if e[0] < e[1]
      end
      return 0
    end
    
    private

    def value_of_high_card
      [0] + @cards.map(&:value).sort.reverse
    end

    def pair?
      @cards.group_by(&:value).values.any? { |e| e.size == 2 }
    end

    def value_of_pair
      pair_value = @cards.group_by(&:value).values.filter { |e| e.size == 2 }.first.first.value
      remaining_card_values = @cards.filter { |c| c.value != pair_value }.map(&:value).sort.reverse
      [1] + [pair_value] + remaining_card_values
    end

    def two_pair?
      @cards.group_by(&:value).values.filter { |e| e.size == 2 }.size == 2
    end

    def value_of_two_pair
      pair_values = @cards.group_by(&:value).values.filter { |e| e.size == 2 }.map { |e| e.first.value }.sort.reverse
      remaining_card_values = @cards.reject { |c| pair_values.include?(c.value) }.map(&:value).sort.reverse
      [2] + pair_values + remaining_card_values
    end

    def three_of_a_kind?
      @cards.group_by(&:value).values.any? { |e| e.size == 3 }
    end

    def value_of_three_of_a_kind
      triplet_value = @cards.group_by(&:value).values.filter { |e| e.size == 3 }.first.first.value
      [3, triplet_value]
    end

    def straight?
      @cards.map(&:value).sort.each_cons(2).all? { |a, b| b == a + 1 }
    end

    def value_of_straight
      [4, @cards.map(&:value).max]
    end

    def flush?
      @cards.group_by(&:suit).size == 1
    end

    def value_of_flush
      [5] + @cards.map(&:value).sort.reverse
    end

    def full_house?
      pair? && three_of_a_kind?
    end

    def value_of_full_house
      triplet_value = @cards.group_by(&:value).values.filter { |e| e.size == 3 }.first.first.value
      [6, triplet_value]
    end

    def four_of_a_kind?
      @cards.group_by(&:value).values.any? { |e| e.size == 4 }
    end

    def value_of_four_of_a_kind
      triplet_value = @cards.group_by(&:value).values.filter { |e| e.size == 4 }.first.first.value
      [7, triplet_value]
    end

    def straight_flush?
      straight? && flush?
    end

    def value_of_straight_flush
      [8, @cards.map(&:value).max]
    end
  end
end
