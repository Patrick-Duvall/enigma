require "./spec/spec_helper"

  describe CaeserCipher do

    before do
      @cipher = CaeserCipher.new(0, 2)
    end

    it 'ciphers a single letter' do
      expect('c').to eq(@cipher.rotate('a'))
    end

    it 'will include spaces' do
      cipher = CaeserCipher.new(4, 0)
      expect(' ').to eq(cipher.rotate('w'))
    end

    it 'rotates back around to a' do
      cipher = CaeserCipher.new(4,1)
      expect('a').to eq(cipher.rotate('w'))
    end

  end
