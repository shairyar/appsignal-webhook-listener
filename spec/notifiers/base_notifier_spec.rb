require 'spec_helper'

RSpec.describe Notifiers::BaseNotifier do
  describe '.notify' do
    it 'raises NotImplementedError' do
      expect { Notifiers::BaseNotifier.notify({}) }.to raise_error(NotImplementedError)
    end
  end

  describe '.listening_to?' do
    it 'raises NotImplementedError' do
      expect { Notifiers::BaseNotifier.listening_to?({}) }.to raise_error(NotImplementedError)
    end
  end
end