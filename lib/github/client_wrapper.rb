# frozen_string_literal: true

require 'octokit'

module GitHub
  class ClientError < StandardError; end

  class ClientWrapper
    def initialize(client = nil)
      @client = client || new_client
    end

    def list_tags(organization, repository)
      # TODO: pagination may be preventing tags from getting listed
      all_refs = @client.refs("#{organization}/#{repository}")
      tags = all_refs.select { |ref| ref.ref.start_with?('refs/tags/') }
      tags.map { |tag| tag.ref.delete_prefix('refs/tags/') }
    end

    private

    def new_client
      Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
    end
  end
end
