# frozen_string_literal: true

require 'kraken'
require 'thor'
require 'kubernetes/client_wrapper'
require 'github/client_wrapper'

module Kraken
  class Error < StandardError; end

  class CLI < Thor
    desc 'hello', 'sup?'
    def hello
      puts 'yes? can I help you?'
    end

    desc 'pods LABEL', 'List the current status of the pods'
    def pods(label, client = Kubernetes::ClientWrapper.new)
      puts "Pods app=#{label}"
      uat_pods = client.find_pods_by_label(label)
      uat_pods.each do |pod|
        puts "- #{pod.metadata.name} : #{pod.status.phase}"
      end
    end

    desc 'tags', 'List the GitHub tags for a project'
    option :organization, default: 'jmtrusona'
    option :repository, default: 'kraken'
    def tags(client = GitHub::ClientWrapper.new)
      puts 'Tags'
      git_tags = client.list_tags(options[:organization], options[:repository])
      git_tags.each do |git_tag|
        puts "- #{git_tag}"
      end
    end
  end
end
