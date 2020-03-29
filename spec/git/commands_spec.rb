# frozen_string_literal: true

require 'git/commands'

RSpec.describe Kraken::Git::Commands do
  context '#whoami' do
    let(:client) { double }

    let(:output) { capture(:stdout) { subject.whoami(client) } }

    it 'displays the repo for the current directory' do
      expect(client).to receive(:remote_url).and_return('git@github.com:blah/blah.git')

      expected = "I am git@github.com:blah/blah.git\n"

      expect(output).to eq(expected)
    end
  end
end
