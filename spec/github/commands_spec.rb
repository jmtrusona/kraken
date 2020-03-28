# frozen_string_literal: true

require 'github/commands'

RSpec.describe Kraken::GitHub::Commands do
  context '#tags' do
    let(:client) { double }

    let(:output) { capture(:stdout) { subject.tags(client) } }

    it 'lists the tags for the github project' do
      # TODO: fix to work with options
      # expect(client).to receive(:list_tags).with('jmtrusona', 'kraken')
      #                                      .and_return(%w[v0.1.0 v0.2.0])

      expect(client).to receive(:list_tags).and_return([
                                                         Kraken::GitHub::Tag.new(name: 'v0.1.0'),
                                                         Kraken::GitHub::Tag.new(name: 'v0.2.0')
                                                       ])
      expected =  "Tags\n"
      expected += "- v0.1.0\n"
      expected += "- v0.2.0\n"

      expect(output).to eq(expected)
    end
  end
end
