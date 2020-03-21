# frozen_string_literal: true

require 'kraken'
require 'thor'
require 'kubernetes'

module Kraken
  class Error < StandardError; end

  class CLI < Thor

    desc 'hello', 'sup?'
    def hello
      puts 'yes? can I help you?'
    end

    desc 'pods LABEL', 'List the current status of the pods'
    def pods(label)
      puts "Pods app=#{label}"
      @kubernetes = Kubernetes::Client.create
      uat_pods = @kubernetes.api('v1').resource('pods', namespace: 'uat')
      uat_pods.list(labelSelector: { app: label }).each do |pod|
        puts "- #{pod.metadata.name} : #{pod.status.phase}"
      end
    end
  end

end