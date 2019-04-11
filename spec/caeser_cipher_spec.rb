require "./spec/spec_helper"

  describe CaeserCipher do

    before do
      @cipher = CaeserCipher.new(2)
    end

    it 'ciphers a single letter' do
      expect('c').to eq(@cipher.rotate('a'))
    end

    it 'will include spaces' do
      cipher = CaeserCipher.new(4)
      expect(' ').to eq(cipher.rotate('w'))
    end

    it 'rotates back around to a' do
      cipher = CaeserCipher.new(5)
      expect('a').to eq(cipher.rotate('w'))
    end

  end
