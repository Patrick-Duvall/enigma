require "./spec/spec_helper"


class Enigma

  def encrypt(string, masterkey, ddmmyy)
    keys = KeyGenerator.generate(masterkey)
    offsets = OffsetGenerator.generate(ddmmyy)
  end

  def rotate(string, masterkey, ddmmyy)
    keys = KeyGenerator.generate(masterkey)
    ciphers = keys.map{|key|CaeserCipher.new(key)}
    offsets = OffsetGenerator.generate(ddmmyy)
  end

  def make_ciphers(masterkey, ddmmyy)

    offsets = OffsetGenerator.generate(ddmmyy)
    keys = KeyGenerator.generate(masterkey)
    cipher_keys = keys.zip(offsets).map(&:sum)
    cipher_keys.map{|key|CaeserCipher.new(key)}
  end


end
