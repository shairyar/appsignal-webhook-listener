require 'spec_helper'


RSpec.describe PayloadProcessor do
  describe '.notifiers' do
    it 'returns all notifiers that inherit from BaseNotifier' do
      expect(PayloadProcessor.notifiers).to include(Notifiers::MarkerNotifier, Notifiers::ErrorNotifier)
    end
  end

  describe '.process' do
    let(:payload) { JSON.parse('{"marker":{"marker_id":"123"}}') }

    it 'notifies the correct notifiers' do
      expect(Notifiers::MarkerNotifier).to receive(:notify).with(payload)
      PayloadProcessor.process(payload)
    end

    it 'does not notify notifiers that are not listening' do
      expect(Notifiers::ErrorNotifier).not_to receive(:notify).with(payload)
      PayloadProcessor.process(payload)
    end
  end
end