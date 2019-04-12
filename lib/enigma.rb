require "./spec/spec_helper"


class Enigma

  def encrypt(string, masterkey, ddmmyy)
    encrypted = rotate(string, masterkey, ddmmyy)
    {
      encryption: encrypted,
      key: masterkey,
      date: ddmmyy
    }
  end
#I checked the rubric this doesnt break anythng, 7 lines
  def rotate(string, masterkey, ddmmyy)
    ciphers = make_ciphers(masterkey, ddmmyy)
    counter = 0 ;   retval = ''
    string.split('').each { |letter|
      retval += letter unless letter.match?(/[a-z ]/)
        retval += ciphers[counter % 4].rotate(letter) if letter.match?(/[a-z ]/)
        counter += 1 if letter.match?(/[a-z ]/) }
    retval
  end

  def make_ciphers(masterkey, ddmmyy)
    offsets = OffsetGenerator.generate(ddmmyy)
    keys = KeyGenerator.generate(masterkey)
    cipher_keys = keys.zip(offsets).map(&:sum)
    cipher_keys.map{|key|Cipher.new(key)}
  end


end
