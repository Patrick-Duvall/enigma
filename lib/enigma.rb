require "./spec/spec_helper"

class Enigma

  def lowcase?(letter)
    letter.match?(/[a-z ]/)
  end

  def encrypt(string, masterkey, ddmmyy=OffsetGenerator.convert_date)
    encrypted = rotate(string, masterkey, ddmmyy)
    {
      encryption: encrypted,
      key: masterkey,
      date: ddmmyy
    }
  end

  def decrypt(string, masterkey, ddmmyy=OffsetGenerator.convert_date)
    decrypted = reverse_rotate(string, masterkey, ddmmyy)
    {
      decryption: decrypted,
      key: masterkey,
      date: ddmmyy
    }
  end

  def crack(string, ddmmyy=OffsetGenerator.convert_date)
    masterkey = "00000"
    until decrypt(string, masterkey, ddmmyy)[:decryption][-4..-1].match?(' end')
      masterkey = (masterkey.to_i) + 1
      masterkey = ('0'+ masterkey.to_s) until masterkey.to_s.length == 5
      masterkey
    end
    decrypt(string, masterkey, ddmmyy)
  end

  def rotate(string, masterkey, ddmmyy)
    ciphers = make_ciphers(masterkey, ddmmyy)
    counter = 0 ;   retval = '' ; string = string.downcase
    string.split('').each do |letter|
      retval += letter unless lowcase?(letter)
      retval += ciphers[counter % 4].rotate(letter) if lowcase?(letter)
      counter += 1 if lowcase?(letter)
    end ; retval
  end

  def reverse_rotate(string, masterkey, ddmmyy)
    ciphers = make_ciphers(masterkey, ddmmyy)
    counter = 0 ;   retval = '' ; string = string.downcase
    string.split('').each { |letter|
      retval += letter unless lowcase?(letter)
      retval += ciphers[counter % 4].reverse_rotate(letter) if lowcase?(letter)
      counter += 1 if lowcase?(letter)
      } ; retval
  end

  def make_ciphers(masterkey, ddmmyy)
    offsets = OffsetGenerator.generate(ddmmyy)
    keys = KeyGenerator.generate(masterkey)
    cipher_keys = keys.zip(offsets).map(&:sum)
    cipher_keys.map{|key|Cipher.new(key)}
  end

end
