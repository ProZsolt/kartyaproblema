require 'rspec/autorun'
require_relative '../lib/hand.rb'

describe CardProblem::Hand do
  describe '#rank' do
    it 'returns 0' do
      expect(CardProblem::Hand.new(%w[2C 3H 5C 7C 9C]).rank).to eq 0
    end

    it 'returns 1' do
      expect(CardProblem::Hand.new(%w[2C 2H 5C 7C 9C]).rank).to eq 1
    end

    it 'returns 2' do
      expect(CardProblem::Hand.new(%w[2C 2H 5C 5C 9C]).rank).to eq 2
    end

    it 'returns 3' do
      expect(CardProblem::Hand.new(%w[2C 2H 2D 5C 9C]).rank).to eq 3
    end

    it 'returns 4' do
      expect(CardProblem::Hand.new(%w[7C 8H 9D TC JC]).rank).to eq 4
    end

    it 'returns 5' do
      expect(CardProblem::Hand.new(%w[6C 8C KC TC JC]).rank).to eq 5
    end

    it 'returns 6' do
      expect(CardProblem::Hand.new(%w[8C 8H 8D JC JH]).rank).to eq 6
    end

    it 'returns 7' do
      expect(CardProblem::Hand.new(%w[8C 8H 8D 8S JH]).rank).to eq 7
    end

    it 'returns 8' do
      expect(CardProblem::Hand.new(%w[7H 8H 9H TH JH]).rank).to eq 8
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
