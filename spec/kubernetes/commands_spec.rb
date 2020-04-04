# frozen_string_literal: true

require 'kubernetes/commands'

RSpec.describe Kraken::Kubernetes::Commands do
  context '#pods' do
    let(:kubernetes) { double }
    let(:pod) { double }
    let(:metadata) { double }
    let(:status) { double }

    let(:output) { capture(:stdout) { subject.pods('taco', kubernetes) } }

    it 'lists the active deployments for given name' do
      expect(kubernetes).to receive(:find_pods_by_label).with('taco')
                                                        .and_return([
                                                                      Kraken::Kubernetes::Pod.new(name: 'bell-abc-123',
                                                                                                  status: 'Running')
                                                                    ])

      expected =  "Pods app=taco\n"
      expected += "- bell-abc-123 : Running\n"

      expect(output).to eq(expected)
    end
  end
end
