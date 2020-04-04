# frozen_string_literal: true

require 'github/commands'

RSpec.describe Kraken::GitHub::Commands do
  context '#release' do
    let(:github) { double }

    let(:output) { capture(:stdout) { subject.release(github) } }

    it 'creates a github release' do
      expect(github).to receive(:release).and_return('Taco Release - 2020-10-10')

      expected = "Created Taco Release - 2020-10-10\n"

      expect(output).to eq(expected)
    end
  end
end
