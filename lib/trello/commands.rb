# frozen_string_literal: true

require 'subcommand_base'
require 'trello/service'

module Kraken
  module Trello
    class Commands < SubcommandBase
      desc 'cards', 'List the Trello cards for a board'
      option :board, default: 'Build'
      def cards(client = Kraken::Trello::Service.new)
        puts 'Cards'
        cards = client.list_cards(options[:board])
        cards.each do |card|
          puts "- #{card.name}"
        end
      end
    end
  end
end
