require "./spec/spec_helper"

  describe Cipher do

    before do
      @cipher = Cipher.new(2)
    end

    it 'ciphers a single letter' do
      expect('c').to eq(@cipher.rotate('a'))
    end

    it 'will include spaces' do
      cipher = Cipher.new(4)
      expect(' ').to eq(cipher.rotate('w'))
    end

    it 'rotates back around to z to a' do
      cipher = Cipher.new(5)
      expect('a').to eq(cipher.rotate('w'))
    end

    it ' reverse ciphers a single letter' do
      expect('a').to eq(@cipher.reverse('c'))
    end

    it 'will include spaces on reverse rotates ' do
      cipher = Cipher.new(3)
      expect(' ').to eq(cipher.reverse('c'))
    end

    it 'reverse rotates back around to from a to z' do
      cipher = Cipher.new(5)
      expect('w').to eq(cipher.reverse('a'))
    end



  end
