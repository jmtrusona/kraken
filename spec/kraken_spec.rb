require 'spec_helper'

RSpec.describe Kraken::CLI do
  it 'has a version number' do
    expect(Kraken::VERSION).not_to be nil
  end

  context '#version' do
    let(:output) { capture(:stdout) { subject.version } }

    it 'displays the current version' do
      expect(output).to eq("#{Kraken::VERSION}\n")
    end
  end

  context '#changelog' do
    let(:output) { capture(:stdout) { subject.changelog } }

    it 'displays the subcommands for changelog' do
      output_lines = output.split("\n")

      expect(output_lines.size).to eq(3)
      expect(output_lines.first).to eq('Commands:')
      expect(output_lines[1]).to include('kraken changelog help [COMMAND]')
      expect(output_lines[2]).to include('kraken changelog view')
    end
  end

  context '#git' do
    let(:output) { capture(:stdout) { subject.git } }

    it 'displays the subcommands for git' do
      output_lines = output.split("\n")

      expect(output_lines.size).to eq(4)
      expect(output_lines.first).to eq('Commands:')
      expect(output_lines[1]).to include('kraken git help [COMMAND]')
      expect(output_lines[2]).to include('kraken git tags')
      expect(output_lines[3]).to include('kraken git whoami')
    end
  end

  context '#github' do
    let(:output) { capture(:stdout) { subject.github } }

    it 'displays the subcommands for github' do
      output_lines = output.split("\n")

      expect(output_lines.size).to eq(3)
      expect(output_lines.first).to eq('Commands:')
      expect(output_lines[1]).to include('kraken github help [COMMAND]')
      expect(output_lines[2]).to include('kraken github release')
    end
  end

  context '#kubernetes' do
    let(:output) { capture(:stdout) { subject.kubernetes } }

    it 'displays the subcommands for kubernetes' do
      output_lines = output.split("\n")

      expect(output_lines.size).to eq(3)
      expect(output_lines.first).to eq('Commands:')
      expect(output_lines[1]).to include('kraken kubernetes help [COMMAND]')
      expect(output_lines[2]).to include('kraken kubernetes pods LABEL')
    end
  end

  context '#trello' do
    let(:output) { capture(:stdout) { subject.trello } }

    it 'displays the subcommands for trello' do
      output_lines = output.split("\n")

      expect(output_lines.size).to eq(3)
      expect(output_lines.first).to eq('Commands:')
      expect(output_lines[1]).to include('kraken trello cards')
      expect(output_lines[2]).to include('kraken trello help [COMMAND]')
    end
  end
end
