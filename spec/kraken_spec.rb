require 'spec_helper'

RSpec.describe Kraken::CLI do
  it 'has a version number' do
    expect(Kraken::VERSION).not_to be nil
  end

  context '#hello' do
    let(:output) { capture(:stdout) { subject.hello } }

    it 'says hello' do
      expect(output).to eq("yes? can I help you?\n")
    end
  end

  context '#pods' do
    let(:client) { double }
    let(:pod) { double }
    let(:metadata) { double }
    let(:status) { double }

    let(:output) { capture(:stdout) { subject.pods('taco', client) } }

    it 'lists the active deployments for given name' do
      expect(client).to receive(:find_pods_by_label).with('taco')
                                                    .and_return([pod])

      expect(pod).to receive(:metadata).and_return(metadata)
      expect(metadata).to receive(:name).and_return('bell-abc-123')

      expect(pod).to receive(:status).and_return(status)
      expect(status).to receive(:phase).and_return('Running')

      expected =  "Pods app=taco\n"
      expected += "- bell-abc-123 : Running\n"

      expect(output).to eq(expected)
    end
  end
end
