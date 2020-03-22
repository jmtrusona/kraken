# frozen_string_literal: true

require 'k8s-client'

module Kubernetes
  class ClientError < StandardError; end

  class ClientWrapper
    def initialize(client = nil)
      @client = client || new_client
    end

    def find_pods_by_label(label)
      @client.api('v1')
             .resource('pods', namespace: 'uat')
             .list(labelSelector: { app: label })
    end

    private

    def new_client
      K8s::Client.config(
        K8s::Config.load_file(
          File.expand_path('~/.kube/config')
        )
      )
    end
  end
end
