# frozen_string_literal: true

module Kraken
  module Changelog
    class Changeset
      attr_accessor :added, :changed, :removed, :fixed

      def initialize(added: [], changed: [], removed: [], fixed: [])
        @added = added
        @changed = changed
        @removed = removed
        @fixed = fixed
      end
    end
  end
end
