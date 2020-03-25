# frozen_string_literal: true

require 'kraken'
require 'kraken/version'

require 'thor'
require 'kubernetes/wrapper'
require 'github/wrapper'
require 'trello/wrapper'
require 'git/service'

module Kraken
  class Error < StandardError; end

  class CLI < Thor
    desc 'version', 'Display the version'
    def version
      puts Kraken::VERSION
    end

    desc 'pods LABEL', 'List the current status of the pods'
    def pods(label, client = Kraken::Kubernetes::Wrapper.new)
      puts "Pods app=#{label}"
      uat_pods = client.find_pods_by_label(label)
      uat_pods.each do |pod|
        puts "- #{pod.name} : #{pod.status}"
      end
    end

    desc 'tags', 'List the GitHub tags for a project'
    option :organization, default: 'jmtrusona'
    option :repository, default: 'kraken'
    def tags(client = Kraken::GitHub::Wrapper.new)
      puts 'Tags'
      git_tags = client.list_tags(options[:organization], options[:repository])
      git_tags.each do |git_tag|
        puts "- #{git_tag.name}"
      end
    end

    desc 'cards', 'List the Trello cards for a board'
    option :board, default: 'Build'
    def cards(client = Kraken::Trello::Wrapper.new)
      puts 'Cards'
      cards = client.list_cards(options[:board])
      cards.each do |card|
        puts "- #{card.name}"
      end
    end

    desc 'whoami', 'Displays the git repo for current directory'
    def whoami(service = Kraken::Git::Service.new)
      puts "I am #{service.remote_url}"
    end
  end
end
