require 'sinatra'
require_relative 'config'

post '/listener' do
  begin
    request.body.rewind
    payload = JSON.parse(request.body.read)
    LOGGER.debug("Parsed payload: #{payload}")
    PayloadProcessor.process(payload)
    status 200
  rescue StandardError => e
    LOGGER.error("Error processing payload: #{e.message}")
    LOGGER.error("Error backtrace:: #{e.backtrace.join("\n")}")
    if Sinatra::Base.production?
      status 500
      body "Internal Server Error"
    end
  end
end