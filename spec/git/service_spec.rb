# frozen_string_literal: true

require 'git/service'

RSpec.describe Kraken::Git::Service do
  context '#remote_url' do
    let(:git_client) { double }
    let(:remote) { double }

    subject { Kraken::Git::Service.new }

    before { subject.instance_variable_set(:@git, git_client) }

    it 'returns the remote url' do
      expect(git_client).to receive(:remote).and_return(remote)
      expect(remote).to receive(:url).and_return('blah/blah')

      result = subject.remote_url
      expect(result).to eq('blah/blah')
    end
  end
end
