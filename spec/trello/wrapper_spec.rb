# frozen_string_literal: true

require 'trello/wrapper'

RSpec.describe Kraken::Trello::Wrapper do
  let(:client) { double }
  let(:board) { double }
  let(:list) { double }
  let(:card) { double }

  subject { Kraken::Trello::Wrapper.new(client) }

  it 'delegates list_cards to the initialized client' do
    expect(client).to receive(:boards)
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
