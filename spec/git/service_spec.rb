# frozen_string_literal: true

require 'git/service'

RSpec.describe Kraken::Git::Service do
  let(:service) { double }
  let(:remote) { double }

  subject { Kraken::Git::Service.new(service) }

  it 'delegates remote_url to the initialized service' do
    expect(service).to receive(:remote).and_return(remote)
    expect(remote).to receive(:url).and_return('blah/blah')

    result = subject.remote_url
    expect(result).to eq('blah/blah')
  end
end
