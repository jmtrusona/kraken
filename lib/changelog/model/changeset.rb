# frozen_string_literal: true

module Kraken
  module Changelog
    class Changeset
      attr_accessor :changes

      def initialize(changes: [])
        @changes = changes
      end
    end
  end
end
