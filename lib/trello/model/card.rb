# frozen_string_literal: true

module Kraken
  module Trello
    class Card
      attr_accessor :name

      def initialize(name = nil)
        @name = name
      end
    end
  end
end
