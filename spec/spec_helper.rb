require 'bundler/setup'
require 'kraken'

RSPEC_ROOT = File.dirname __FILE__

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each) do
    $0 = 'kraken'  # Pretend we're running as 'kraken'
    ARGV.clear     # Make sure no args are passed to the commands.
  end

  # Captures the output for analysis later
  #
  # @example Capture `$stderr`
  #
  #     output = capture(:stderr) { $stderr.puts "this is captured" }
  #
  # @param [Symbol] stream `:stdout` or `:stderr`
  # @yield The block to capture stdout/stderr for.
  # @return [String] The contents of $stdout or $stderr
  def capture(stream)
    begin
      stream = stream.to_s
      eval "$#{stream} = StringIO.new"
      yield
      result = eval("$#{stream}").string
    ensure
      eval("$#{stream} = #{stream.upcase}")
    end

    result
  end

  # Silences the output stream
  #
  # @example Silence `$stdout`
  #
  #     silence(:stdout) { $stdout.puts "hi" }
  #
  # @param [IO] stream The stream to use such as $stderr or $stdout
  # @return [nil]
  alias :silence :capture
end
