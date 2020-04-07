# frozen_string_literal: true

require 'github/commands'

RSpec.describe Kraken::GitHub::Commands do
  context '#release' do
    let(:github) { double }

    let(:output) { capture(:stdout) { subject.release(github) } }

    it 'creates a github release' do
      expect(github).to receive(:perform_release).and_return('http://github.com/release/tacos')

      expected = "Created http://github.com/release/tacos\n"

      expect(output).to eq(expected)
    end
  end
end
