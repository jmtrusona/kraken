require 'spec_helper'

RSpec.describe Kraken::CLI do
  it 'has a version number' do
    expect(Kraken::VERSION).not_to be nil
  end

  context '#version' do
    let(:output) { capture(:stdout) { subject.version } }

    it 'displays the current version' do
      expect(output).to eq("#{Kraken::VERSION}\n")
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

  context '#tags' do
    let(:client) { double }

    let(:output) { capture(:stdout) { subject.tags(client) } }

    it 'lists the tags for the github project' do
      # TODO: fix to work with options
      # expect(client).to receive(:list_tags).with('jmtrusona', 'kraken')
      #                                      .and_return(%w[v0.1.0 v0.2.0])

      expect(client).to receive(:list_tags).and_return(%w[v0.1.0 v0.2.0])
      expected =  "Tags\n"
      expected += "- v0.1.0\n"
      expected += "- v0.2.0\n"

      expect(output).to eq(expected)
    end
  end

  context '#cards' do
    let(:client) { double }

    let(:output) { capture(:stdout) { subject.cards(client) } }

    it 'lists the cards for the trello board' do
      expect(client).to receive(:list_cards).and_return(['Build something new'])

      expected =  "Cards\n"
      expected += "- Build something new\n"

      expect(output).to eq(expected)
    end
  end
end
