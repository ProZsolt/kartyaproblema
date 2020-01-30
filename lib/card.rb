module CardProblem
  class Card
    attr_reader :suit
    attr_reader :value

    def initialize(card)
      @suit = card[1]
      @value = value_from_char(card[0])
    end

    def value_from_char(char)
      case char
      when 'T'
        10
      when 'J'
        11
      when 'Q'
        12
      when 'K'
        13
      when 'A'
        14
      else
        char.to_i
      end
    end
  end
end
