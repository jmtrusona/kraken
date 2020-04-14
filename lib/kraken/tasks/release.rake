# frozen_string_literal: true

require 'kraken'

namespace :kraken do
  task :release do
    Kraken::CLI.start(['release'])
  end
end
