
require "./spec/spec_helper"

describe Enigma do

  it 'exists' do
    enigma = Enigma.new
    expect(enigma).to be_an(Enigma)
  end

  it 'checks valid letters' do
    enigma = Enigma.new
    expect(true).to eq(enigma.lowcase?('a'))
    expect(false).to eq(enigma.lowcase?('A'))
    expect(true).to eq(enigma.lowcase?(' '))
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

  it 'encrypts a message without a date' do
    enigma = Enigma.new
    expect(enigma.encrypt("hello world", "02715")).to be_a(Hash)
    expect(enigma.encrypt("hello world", "02715")[:date]).to match(/\d{6}/)
  end

  it 'makes ciphers' do
    enigma = Enigma.new
    expect(enigma.make_ciphers('02715', '040895').each{|cipher| cipher.is_a?(Cipher)})
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
      expect(expected).to eq(enigma.decrypt("keder ohulw", "02715", "040895"))
    end

    it 'decrypts a message without a date' do
      enigma = Enigma.new
      expect(enigma.decrypt("hello world", "02715")).to be_a(Hash)
      expect(enigma.decrypt("hello world", "02715")[:date]).to match(/\d{6}/)
    end

    it 'reverse rotates a string' do
      enigma = Enigma.new
      expect(enigma.reverse_rotate("keder ohulw", "02715", "040895")).to eq("hello world")
    end

    it 'cracks a code with a date' do
      enigma = Enigma.new
      expected = {
        decryption: "hello world end",
        date: "291018",
        key: "08304"
      }
      expect(expected).to eq(enigma.crack("vjqtbeaweqihssi", "291018"))
    end


  end
