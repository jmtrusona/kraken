# frozen_string_literal: true

require 'thor'

class SubcommandBase < Thor
  def self.banner(command, _namespace = nil, _subcommand = false)
    "#{basename} #{subcommand_prefix} #{command.usage}"
  end

  def self.subcommand_prefix
    # expected sub command format - "Kraken::<name>::Commands"
    name.split(/::/)[1].downcase
  end
end
