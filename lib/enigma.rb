require "./spec/spec_helper"


class Enigma

  # def encrypt(string, masterkey, ddmmyy)
  #   keys = KeyGenerator.generate(masterkey)
  #   offsets = OffsetGenerator.generate(ddmmyy)
  # end

  def rotate(string, masterkey, ddmmyy)
    ciphers = make_ciphers(masterkey, ddmmyy)
    counter = 0
    retval = ''
    string.split('').each do|letter|
      if letter.match?(/[a-z ]/)
        # require "pry"; binding.pry
        retval += ciphers[counter % 4].rotate(letter)
        counter += 1
      else
        retval += letter
      end
      retval
    end
    retval
  end

  def make_ciphers(masterkey, ddmmyy)
    offsets = OffsetGenerator.generate(ddmmyy)
    keys = KeyGenerator.generate(masterkey)
    cipher_keys = keys.zip(offsets).map(&:sum)
    cipher_keys.map{|key|CaeserCipher.new(key)}
  end


end
