# frozen_string_literal: true

require 'trello/commands'

RSpec.describe Kraken::Trello::Commands do
  context '#cards' do
    let(:trello) { double }

    let(:output) { capture(:stdout) { subject.cards(trello) } }

    it 'lists the cards for the trello board' do
      expect(trello).to receive(:list_cards).and_return([
                                                          Kraken::Trello::Card.new(name: 'Build something new')
                                                        ])

      expected =  "Cards\n"
      expected += "- Build something new\n"

      expect(output).to eq(expected)
    end
  end
end
