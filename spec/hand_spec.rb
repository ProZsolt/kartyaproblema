require 'rspec/autorun'
require_relative '../lib/hand.rb'

describe CardProblem::Hand do
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
      expect(CardProblem::Hand.new(%w[7C 8H 9D TC JC]).rank).to eq 'Straight'
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
      expect(CardProblem::Hand.new(%w[7H 8H 9H TH JH]).rank).to eq 'Straight flush'
    end
  end

  describe '#<=>' do
    it 'returns true' do
      three_of_a_kind = CardProblem::Hand.new(%w[2C 2H 2D 5C 9C])
      flush = CardProblem::Hand.new(%w[6C 8C KC TC JC])

      expect(three_of_a_kind <=> flush).to eq(-1)
    end
  end
end
