# frozen_string_literal: true

require 'trello'
require 'trello/model/card'

module Kraken
  module Trello
    class Error < StandardError; end

    class Wrapper
      def initialize(client = nil)
        @client = client || real_client
      end

      def list_cards(board_name)
        cards = []
        board = find_board(board_name)

        board.lists.each do |list|
          cards += list.cards.map do |card|
            Kraken::Trello::Card.new(name: card.name)
          end
        end
        cards
      end

      private

      def real_client
        ::Trello.configure do |config|
          config.developer_public_key = ENV['TRELLO_APP_KEY']
          config.member_token = ENV['TRELLO_MEMBER_TOKEN']
        end
        ::Trello::Member.find(ENV['TRELLO_USERNAME'])
      end

      def find_board(board_name)
        @client.boards.find { |board| board.name == board_name }
      end
    end
  end
end
