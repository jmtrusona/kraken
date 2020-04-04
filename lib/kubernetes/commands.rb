# frozen_string_literal: true

require 'subcommand_base'
require 'kubernetes/service'

module Kraken
  module Kubernetes
    class Commands < SubcommandBase
      desc 'pods LABEL', 'List the current status of the pods'
      def pods(label, kubernetes = Kraken::Kubernetes::Service.new)
        puts "Pods app=#{label}"
        uat_pods = kubernetes.find_pods_by_label(label)
        uat_pods.each do |pod|
          puts "- #{pod.name} : #{pod.status}"
        end
      end
    end
  end
end
