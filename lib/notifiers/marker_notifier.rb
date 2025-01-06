module Notifiers
  # This is just an example of a notifier that listens for a new marker
  class MarkerNotifier < BaseNotifier
    def self.notify(payload)
      LOGGER.debug("MarkerNotifier notified: #{payload}")
      # Add some logic here to send webhook to third party service
    end

    def self.listening_to?(payload)
      payload.key?("marker")
    end
  end
end