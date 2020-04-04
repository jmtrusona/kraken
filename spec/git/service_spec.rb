# frozen_string_literal: true

require 'git/service'

RSpec.describe Kraken::Git::Service do
  let(:client) { double }
  let(:remote) { double }

  subject { Kraken::Git::Service.new }

  before { subject.instance_variable_set(:@git, client) }

  it 'delegates remote_url to the initialized service' do
    expect(client).to receive(:remote).and_return(remote)
    expect(remote).to receive(:url).and_return('blah/blah')

    result = subject.remote_url
    expect(result).to eq('blah/blah')
  end
end
