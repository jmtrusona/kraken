# frozen_string_literal: true

require 'git/commands'

RSpec.describe Kraken::Git::Commands do
  context '#whoami' do
    let(:git) { double }

    let(:output) { capture(:stdout) { subject.whoami(git) } }

    it 'displays the repo for the current directory' do
      expect(git).to receive(:remote_url).and_return('git@github.com:blah/blah.git')

      expected = "I am git@github.com:blah/blah.git\n"

      expect(output).to eq(expected)
    end
  end

  context '#tags' do
    let(:git) { double }

    let(:output) { capture(:stdout) { subject.tags(git) } }

    it 'lists the tags for the current directory' do
      expect(git).to receive(:list_tags).and_return([
                                                      Kraken::Git::Tag.new(name: 'v0.1.0'),
                                                      Kraken::Git::Tag.new(name: 'v0.2.0')
                                                    ])
      expected =  "Tags\n"
      expected += "- v0.1.0\n"
      expected += "- v0.2.0\n"

      expect(output).to eq(expected)
    end
  end
end
