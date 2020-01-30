module CardProblem
  class Hand
    def initialize(cards)
      @cards = cards
    end

    def rank
      0
    end

    def <=>(other)
      rank <=> other.rank
    end
  end
end
