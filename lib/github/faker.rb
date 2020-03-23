# frozen_string_literal: true

require 'github/tag'

module Kraken
  module GitHub
    class Faker
      def list_tags(_organization, _repository)
        [Kraken::GitHub::Tag('v0.1.0')]
      end
    end
  end
end
