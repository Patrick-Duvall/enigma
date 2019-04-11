require "./spec/spec_helper"

  describe CaeserCipher do

    before do
      @cipher = CaeserCipher.new(0)
    end

    it 'ciphers a single letter' do

      expect('c').to eq(@cipher.rotate('a', 2))

    end

    it 'will include spaces' do
      cipher = CaeserCipher.new(4)
      expect(' ').to eq(cipher.rotate('w', 0))
    end


    it 'rotates back around to a' do
      cipher = CaeserCipher.new(4)
      expect('a').to eq(cipher.rotate('w', 1))

  end



  end
