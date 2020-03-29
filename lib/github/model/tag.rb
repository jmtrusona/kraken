# frozen_string_literal: true

module Kraken
  module GitHub
    class Tag
      attr_accessor :name

      def initialize(name:)
        @name = name
      end
    end
  end
end
