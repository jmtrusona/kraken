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
    let(:output) { capture(:stdout) { subject.pods('trusona') } }

    it 'lists the active deployments for given name' do
      expected =  "Pods app=trusona\n"
      expected += "- trusona-deployment-577cfb56c9-q5mzf : Running\n"
      expected += "- trusona-deployment-577cfb56c9-rzlgc : Running\n"

      expect(output).to eq(expected)
    end
  end
end
