# frozen_string_literal: true

require 'k8s-client'
require 'kubernetes/model/pod'

module Kraken
  module Kubernetes
    class Service
      def initialize
        @kubernetes = client
      end

      def find_pods_by_label(label)
        pods_raw = @kubernetes.api('v1')
                              .resource('pods', namespace: 'uat')
                              .list(labelSelector: { app: label })

        pods_raw.map do |pod_raw|
          name = pod_raw.metadata.name
          status = pod_raw.status.phase
          Kraken::Kubernetes::Pod.new(name: name,
                                      status: status)
        end
      end

      private

      def client
        return @kubernetes if @kubernetes

        K8s::Client.config(
          K8s::Config.load_file(
            File.expand_path('~/.kube/config')
          )
        )
      end
    end
  end
end
