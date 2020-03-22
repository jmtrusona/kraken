# frozen_string_literal: true

require 'github/client_wrapper'

RSpec.describe GitHub::ClientWrapper do
  let(:client) { double }

  subject { GitHub::ClientWrapper.new(client) }

  it 'delegates list_tags to the initialized client' do
    expect(client).to receive(:refs).with('burrito/taco-server')
                                    .and_return([
                                                  double_ref('refs/tags/v0.1.0'),
                                                  double_ref('refs/tags/v0.2.0'),
                                                  double_ref('blah')
                                                ])

    tags = subject.list_tags('burrito', 'taco-server')
    expect(tags).to eq(%w[v0.1.0 v0.2.0])
  end

  private

  def double_ref(tag)
    ref = double
    expect(ref).to receive(:ref).at_least(1).times
                                .and_return(tag)
    ref
  end
end
