# frozen_string_literal: true

require 'subcommand_base'
require 'kubernetes/wrapper'

module Kraken
  module Kubernetes
    class Commands < SubcommandBase
      desc 'pods LABEL', 'List the current status of the pods'
      def pods(label, client = Kraken::Kubernetes::Wrapper.new)
        puts "Pods app=#{label}"
        uat_pods = client.find_pods_by_label(label)
        uat_pods.each do |pod|
          puts "- #{pod.name} : #{pod.status}"
        end
      end
    end
  end
end
