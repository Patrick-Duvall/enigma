require "./spec/spec_helper"

  describe CaeserCipher do

    before do
      @cipher = CaeserCipher.new(0)
    end

    it 'ciphers a single letter' do

      expect('c').to eq(@cipher.rotate('a', 2))

    end



  end
