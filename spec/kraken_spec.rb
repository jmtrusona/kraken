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
                                                    .and_return([
                                                                  Kraken::Kubernetes::Pod.new(name: 'bell-abc-123',
                                                                                              status: 'Running')
                                                                ])

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

      expect(client).to receive(:list_tags).and_return([
                                                         Kraken::GitHub::Tag.new(name: 'v0.1.0'),
                                                         Kraken::GitHub::Tag.new(name: 'v0.2.0')
                                                       ])
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
      expect(client).to receive(:list_cards).and_return([
                                                          Kraken::Trello::Card.new(name: 'Build something new')
                                                        ])

      expected =  "Cards\n"
      expected += "- Build something new\n"

      expect(output).to eq(expected)
    end
  end

  context '#whoami' do
    let(:service) { double }

    let(:output) { capture(:stdout) { subject.whoami(service) } }

    it 'displays the repo for the current directory' do
      expect(service).to receive(:remote_url).and_return('git@github.com:blah/blah.git')

      expected = "I am git@github.com:blah/blah.git\n"

      expect(output).to eq(expected)
    end
  end
end
