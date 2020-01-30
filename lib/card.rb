module CardProblem
  class Card
    attr_reader :suit
    attr_reader :value

    def initialize(card)
      validate_input(card)
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

    private

    def validate_input(card)
      raise ArgumentError, 'Argument is not String' unless card.is_a?(String)
      unless card.size == 2 &&
             %w[2 3 4 5 6 7 8 9 T J Q K A].include?(card[0]) &&
             %w[C D H S].include?(card[1])
        raise ArgumentError, 'Required argument is [23456789TJQKA][CDHS]'
      end
    end
  end
end
