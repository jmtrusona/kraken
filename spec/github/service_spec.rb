# frozen_string_literal: true

require 'github/service'

RSpec.describe Kraken::GitHub::Service do
  context '#release' do
    let(:github_client) { double }

    subject { Kraken::GitHub::Service.new(github_client) }

    it 'creates a github release' do
      expect(github_client).to receive(:create_release).and_return({ html_url: 'http://github.com/release/blah' })

      project = Kraken::GitHub::Project.new(
        organization: 'yolo',
        repository: 'stuff-doer'
      )
      release = Kraken::GitHub::Release.new(
        project: project,
        release_card: '1234'
      )

      subject.perform_release(release)
    end
  end
end
