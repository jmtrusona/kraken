require 'spec_helper'

RSpec.describe Kraken::CLI do
  it 'has a version number' do
    expect(Kraken::VERSION).not_to be nil
  end

  context '#hello' do
    let(:output) { capture(:stdout) { subject.hello } }

    it 'says hello' do
      expect(output).to eq("yes? can I help you?\n")
    end
  end
end
