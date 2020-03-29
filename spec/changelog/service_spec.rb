# frozen_string_literal: true

require 'changelog/service'

RSpec.describe Kraken::Changelog::Service do
  let(:file) { double }

  subject { Kraken::Changelog::Service.new }

  xit 'parses the CHANGELOG.md' do
    expect(File).to receive(:open).with('CHANGELOG.md').and_return(file)

    result = subject.parse

    expect(result).to be
  end
end
