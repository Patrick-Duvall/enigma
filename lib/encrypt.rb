require "./spec/spec_helper"

if ARGV.length != 2
  puts "Please run with a file to encrypt and a location to encrypt to"
  exit
end

to_encrypt = File.read(ARGV[0])
puts to_encrypt

enigma = Enigma.new
encrypted = enigma.encrypt(to_encrypt, KeyGenerator.make_master, OffsetGenerator.convert_date)

File.write(ARGV[1], encrypted[:encryption])

require "pry"; binding.pry

puts encrypted
