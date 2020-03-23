# frozen_string_literal: true

module Kraken
  module Kubernetes
    class Pod
      attr_accessor :name, :status
      def initialize(name = nil, status = nil)
        @name = name
        @status = status
      end
    end
  end
end
