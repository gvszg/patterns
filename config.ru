# Start with: shotgun
# Under Windows: rackup  (CTRL+C and restart on each change)
require "pry"

require ::File.expand_path('../lib/boot', __FILE__)

class Logger
  def initialize(app)
    @app = app
  end

  def call(env)
    puts "Call " + env["PATH_INFO"]
    status, headers, body = @app.call(env)
    [status, headers, body]
    # xss_detect(body)
    # Rack::Lint::LintError: Status must be >=100 seen as integer
    # puts "Nice!"
  end
end

use Logger

require "application"
run Application.new