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
  end
end
