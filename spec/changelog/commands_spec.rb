# frozen_string_literal: true

require 'changelog/commands'

RSpec.describe Kraken::Changelog::Commands do
  context '#view' do
    let(:service) { double }

    let(:output) { capture(:stdout) { subject.view(service) } }

    it 'parses the CHANGELOG.md and displays the releases and changesets' do
      expect(service).to receive(:parse).and_return([
                                                      Kraken::Changelog::Release.new(version: '1.2.3',
                                                                                     release_date: 'Feb 4, 2010')
                                                    ])

      expected = "Version: 1.2.3\n"

      expect(output).to eq(expected)
    end
  end
end
