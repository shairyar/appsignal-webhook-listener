require 'json'
require 'logger'
require 'zeitwerk'
require 'debug'

loader = Zeitwerk::Loader.new
loader.push_dir("./lib")
loader.enable_reloading
loader.setup

# Default log level is INFO, set it to DEBUG or ERROR to view debug logs
log_level = ENV['LOG_LEVEL'] || Logger::INFO
LOGGER = Logger.new(STDOUT)
LOGGER.level = log_level