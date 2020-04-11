# frozen_string_literal: true

module Kraken
  module Changelog
    class Change
      attr_accessor :type, :description

      def initialize(type:, description:)
        @type = type
        @description = description
      end
    end
  end
end
