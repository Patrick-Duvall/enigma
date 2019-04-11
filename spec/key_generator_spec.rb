require "./spec/spec_helper"

  describe KeyGenerator do

    it 'generates 4 keys using a provided master key' do
      expect([02,27,71,15]).to eq(KeyGenerator.generate('02715'))
    end

    it 'generates a master key' do
      expect(KeyGenerator.make_master).to match(/\d{5}/)
    end

    it 'uses a random masterkey if none is given' do
      expect(KeyGenerator.generate().length).to eq(4)
      expect(KeyGenerator.generate().each{|el| el.is_a?(Integer)})
    end
  end
