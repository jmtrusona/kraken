# frozen_string_literal: true

require 'github/service'

RSpec.describe Kraken::GitHub::Service do
  context '#release' do
    let(:github_client) { double }

    subject { Kraken::GitHub::Service.new }

    before { subject.instance_variable_set(:@github, github_client) }

    it 'creates a github release' do
      expect(github_client).to receive(:create_release)

      subject.release(
        project: Kraken::GitHub::Project.new(
          organization: 'mulhern-industries',
          project: 'cat-creator-3000'
        ),
        release_notes: 'See CHANGELOG.md for updates',
        release_card: '1234'
      )
    end
  end
end
