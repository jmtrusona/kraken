# frozen_string_literal: true

require 'git/wrapper'

RSpec.describe Kraken::Git::Wrapper do
  let(:client) { double }
  let(:remote) { double }

  subject { Kraken::Git::Wrapper.new(client: client) }

  it 'delegates remote_url to the initialized service' do
    expect(client).to receive(:remote).and_return(remote)
    expect(remote).to receive(:url).and_return('blah/blah')

    result = subject.remote_url
    expect(result).to eq('blah/blah')
  end
end
