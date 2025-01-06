module Notifiers
  class BaseNotifier
    def self.notify(payload)
      raise NotImplementedError, 'Subclasses must implement the notify method'
    end

    def self.listening_to?(payload)
      raise NotImplementedError, 'Subclasses must implement the listening_to? method'
    end
  end
end