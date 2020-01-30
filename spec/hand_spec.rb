require 'rspec/autorun'
require_relative '../lib/hand.rb'

describe CardProblem::Hand do # rubocop:disable Metrics/BlockLength
  describe '#rank' do
    it 'returns High Card' do
      expect(CardProblem::Hand.new(%w[2C 3H 5C 7C 9C]).rank).to eq 'High Card'
    end

    it 'returns Pair' do
      expect(CardProblem::Hand.new(%w[2C 2H 5C 7C 9C]).rank).to eq 'Pair'
    end

    it 'returns Two Pairs' do
      expect(CardProblem::Hand.new(%w[2C 2H 5C 5C 9C]).rank).to eq 'Two Pairs'
    end

    it 'returns Three of a Kind' do
      expect(CardProblem::Hand.new(%w[2C 2H 2D 5C 9C]).rank).to eq 'Three of a Kind'
    end

    it 'returns Straight' do
      expect(CardProblem::Hand.new(%w[JC 8H 9D TC 7C]).rank).to eq 'Straight'
    end

    it 'returns Flush' do
      expect(CardProblem::Hand.new(%w[6C 8C KC TC JC]).rank).to eq 'Flush'
    end

    it 'returns Full House' do
      expect(CardProblem::Hand.new(%w[8C 8H 8D JC JH]).rank).to eq 'Full House'
    end

    it 'returns Four of a kind' do
      expect(CardProblem::Hand.new(%w[8C 8H 8D 8S JH]).rank).to eq 'Four of a kind'
    end

    it 'returns Straight flush' do
      expect(CardProblem::Hand.new(%w[JH 8H 9H TH 7H]).rank).to eq 'Straight flush'
    end
  end

  describe 'value' do
    it 'returns [0, 9, 7, 5, 3, 2]' do
      expect(CardProblem::Hand.new(%w[2C 3H 5C 7C 9C]).value).to eq [0, 9, 7, 5, 3, 2]
    end

    it 'returns [1, 2, 9, 7, 5]' do
      expect(CardProblem::Hand.new(%w[2C 2H 5C 7C 9C]).value).to eq [1, 2, 9, 7, 5]
    end

    it 'returns [2, 5, 2, 9]' do
      expect(CardProblem::Hand.new(%w[2C 2H 5C 5C 9C]).value).to eq [2, 5, 2, 9]
    end

    it 'returns [3, 2]' do
      expect(CardProblem::Hand.new(%w[2C 2H 2D 5C 9C]).value).to eq [3, 2]
    end

    it 'returns [4, 11]' do
      expect(CardProblem::Hand.new(%w[JC 8H 9D TC 7C]).value).to eq [4, 11]
    end

    it 'returns [5, 13, 11, 10, 8, 6]' do
      expect(CardProblem::Hand.new(%w[6C 8C KC TC JC]).value).to eq [5, 13, 11, 10, 8, 6]
    end

    it 'returns [6, 8]' do
      expect(CardProblem::Hand.new(%w[8C 8H 8D JC JH]).value).to eq [6, 8]
    end

    it 'returns [7, 8]' do
      expect(CardProblem::Hand.new(%w[8C 8H 8D 8S JH]).value).to eq [7, 8]
    end

    it 'returns [8, 11]' do
      expect(CardProblem::Hand.new(%w[JH 8H 9H TH 7H]).value).to eq [8, 11]
    end
  end

  describe '#<=>' do
  CardProblem::Hand.new(%w[2C 2H 5C 5C 9C])
    it 'returns -1' do
      three_of_a_kind = CardProblem::Hand.new(%w[2C 2H 2D 5C 9C])
      flush = CardProblem::Hand.new(%w[6C 8C KC TC JC])

      expect(three_of_a_kind <=> flush).to eq(-1)
    end

    it 'returns 1' do
      two_pair1 = CardProblem::Hand.new(%w[3C 3H 5D 5C 7H])
      two_pair2 = CardProblem::Hand.new(%w[2C 2H 5H 5S 9C])

      expect(two_pair1 <=> two_pair2).to eq(1)
    end

    it 'returns 0' do
      pair1 = CardProblem::Hand.new(%w[2C 2H 3D 5C 9C])
      pair2 = CardProblem::Hand.new(%w[2D 2S 3C 5S 9S])

      expect(pair1 <=> pair2).to eq(0)
    end
  end
end
