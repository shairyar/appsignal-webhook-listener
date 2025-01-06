module Notifiers
  # This is just an example of a notifier that listens for exceptions
  class ErrorNotifier < BaseNotifier
    def self.notify(payload)
      LOGGER.debug("ErrorNotifier notified: #{payload}")
      # Add some logic here to send webhook to third party service
    end

    def self.listening_to?(payload)
      payload.key?("exception")
    end
  end
end