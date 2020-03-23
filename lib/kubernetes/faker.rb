# frozen_string_literal: true

module Kraken
  module Kubernetes
    class Faker
      def find_pods_by_label(_label)
        []
      end
    end
  end
end
