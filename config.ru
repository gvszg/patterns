# Start with: shotgun
# Under Windows: rackup  (CTRL+C and restart on each change)
require "pry"

require ::File.expand_path('../lib/boot', __FILE__)
require "application"
run Application.new