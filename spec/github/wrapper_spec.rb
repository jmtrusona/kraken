# frozen_string_literal: true

require 'github/wrapper'

RSpec.describe Kraken::GitHub::Wrapper do
  let(:client) { double }

  subject { Kraken::GitHub::Wrapper.new(client: client) }

  it 'delegates list_tags to the initialized client' do
    expect(client).to receive(:refs).with('burrito/taco-server')
                                    .and_return([
                                                  double_ref('refs/tags/v0.1.0'),
                                                  double_ref('refs/tags/v0.2.0'),
                                                  double_ref('blah')
                                                ])

    tags = subject.list_tags('burrito', 'taco-server')
    expect(tags.map(&:name)).to eq(%w[v0.1.0 v0.2.0])
  end

  private

  def double_ref(tag)
    fake_ref = double
    expect(fake_ref).to receive(:ref).at_least(1).times
                                     .and_return(tag)
    fake_ref
  end
end
