# frozen_string_literal: true

require 'kraken/service'

RSpec.describe Kraken::Service do
  let(:git) { double }
  let(:github) { double }

  subject { Kraken::Service.new }

  before do
    subject.instance_variable_set(:@git, git)
    subject.instance_variable_set(:@github, github)
  end

  context '#release' do
    it 'performs a github release' do
      expect(git).to receive(:org_and_repo)
        .and_return(%w[taco scrimp])

      expect_any_instance_of(Thor::Actions).to receive(:yes?)
        .with('Would you like to release Scrimp (taco/scrimp)?')
        .and_return(true)

      expect_any_instance_of(Thor::Actions).to receive(:ask)
        .with('What is the Trello release card number?')
        .and_return('1234')

      expect_any_instance_of(Thor::Actions).to receive(:ask)
        .with('What was in this release?')
        .and_return('added a feature')

      expect_any_instance_of(Thor::Actions).to receive(:yes?)
        .with('Anything else?')
        .and_return(false)

      expect_any_instance_of(Thor::Actions).to receive(:yes?)
        .with('Does this look good?')
        .and_return(true)

      expect(github).to receive(:perform_release)
        .and_return('http://github.com/releases/taco/shrimp/123')

      subject.release
    end
  end
end
