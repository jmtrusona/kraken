require 'spec_helper'

RSpec.describe Kraken::CLI do
  it 'has a version number' do
    expect(Kraken::VERSION).not_to be nil
  end

  context '#version' do
    let(:output) { capture(:stdout) { subject.version } }

    it 'displays the current version' do
      expect(output).to eq("#{Kraken::VERSION}\n")
    end
  end
end
