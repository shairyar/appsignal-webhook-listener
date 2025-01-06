class PayloadProcessor
  def self.notifiers
    Notifiers.constants.map { |const| Notifiers.const_get(const) }.select { |klass| klass < Notifiers::BaseNotifier }
  end

  def self.process(payload)
    LOGGER.debug("All Notifiers: #{notifiers}")
    notifiers.each do |notifier|
      if notifier.listening_to?(payload)
        LOGGER.info("Notified: #{notifier}")
        notifier.notify(payload)
      else
        LOGGER.debug("Notifier #{notifier} is not listening for it")
      end

    end
  end
end