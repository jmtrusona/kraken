# frozen_string_literal: true

require 'k8s-client'

module Kubernetes
  class Client

    def self.create
      K8s::Client.config(
        K8s::Config.load_file(
          File.expand_path('~/.kube/config')
        )
      )
    end

  end
end