
require "./spec/spec_helper"

describe Enigma do

  it 'exists' do
    enigma = Enigma.new
    expect(enigma).to be_an(Enigma)
  end

  it 'encrypts a message with key and date' do
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    enigma = Enigma.new
    expect(expected).to eq(enigma.encrypt("hello world", "02715", "040895"))
  end

  it 'makes ciphers' do
    enigma = Enigma.new
    expect(enigma.make_ciphers('02715', '040895').each{|cipher| cipher.is_a?(CaeserCipher)})
    end

    it 'rotates a string' do
      enigma = Enigma.new
      expect(enigma.rotate("hello world", "02715", "040895")).to eq("keder ohulw")
    end

    it 'decrypts a message with key and date' do
      expected = {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }
      enigma = Enigma.new
      expect(expected).to eq(enigma.decrypt("hello world", "02715", "040895"))
    end


  end
