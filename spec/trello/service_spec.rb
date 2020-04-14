# frozen_string_literal: true

require 'trello/service'

RSpec.describe Kraken::Trello::Service do
  context '#list_cards' do
    let(:trello_client) { double }
    let(:board) { double }
    let(:list) { double }
    let(:card) { double }

    subject { Kraken::Trello::Service.new(trello_client) }

    it 'lists the cards for the given board' do
      expect(trello_client).to receive(:boards)
        .and_return([board])

      expect(board).to receive(:name)
        .and_return('quesadilla')

      expect(board).to receive(:lists)
        .and_return([list])

      expect(list).to receive(:cards)
        .and_return([card])

      expect(card).to receive(:name)
        .and_return('Build a new thing')

      cards = subject.list_cards('quesadilla')

      expect(cards.map(&:name)).to eq(['Build a new thing'])
    end
  end
end
