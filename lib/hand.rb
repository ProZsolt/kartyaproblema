module CardProblem
  class Hand
    def initialize(cards)
      @cards = cards.map { |c| { suit: c[1], value: c[0] } }
    end

    def rank
      if pair?
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
      false
    end
  end
end
