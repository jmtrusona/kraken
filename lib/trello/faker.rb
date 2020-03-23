# frozen_string_literal: true

require 'trello'

module Kraken
  module Trello
    class Faker
      def list_cards(_board_name)
        ['Build something']
      end
    end
  end
end
