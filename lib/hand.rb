module CardProblem
  class Hand
    def initialize(cards)
      @cards = cards.map { |c| cardstring_to_hash(c) }
    end

    def rank
      if straight_flush?
        8
      elsif four_of_a_kind?
        7
      elsif full_house?
        6
      elsif flush?
        5
      elsif straight?
        4
      elsif three_of_a_kind?
        3
      elsif two_pair?
        2
      elsif pair?
        1
      else
        0
      end
    end

    def <=>(other)
      rank <=> other.rank
    end

    private

    def pair?
      @cards.group_by { |c| c[:value] }.values.any? { |e| e.size == 2 }
    end

    def two_pair?
      @cards.group_by { |c| c[:value] }.values.filter { |e| e.size == 2 }.size == 2
    end

    def three_of_a_kind?
      @cards.group_by { |c| c[:value] }.values.any? { |e| e.size == 3 }
    end

    def straight?
      @cards.map { |c| c[:value] }.sort.each_cons(2).all? { |a, b| b == a + 1 }
    end

    def flush?
      @cards.group_by { |c| c[:suit] }.size == 1
    end

    def full_house?
      pair? && three_of_a_kind?
    end

    def four_of_a_kind?
      @cards.group_by { |c| c[:value] }.values.any? { |e| e.size == 4 }
    end

    def straight_flush?
      straight? && flush?
    end

    def cardstring_to_hash(str)
      case str[0]
      when 'T'
        { suit: str[1], value: 10 }
      when 'J'
        { suit: str[1], value: 11 }
      when 'Q'
        { suit: str[1], value: 12 }
      when 'K'
        { suit: str[1], value: 13 }
      when 'A'
        { suit: str[1], value: 14 }
      else
        { suit: str[1], value: str[0].to_i }
      end
    end
  end
end
