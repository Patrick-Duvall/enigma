require "./spec/spec_helper"

if ARGV.length != 2
  puts "Please run with a file to encrypt and a location to encrypt to"
  exit
end

to_encrypt = File.read(ARGV[0])
puts to_encrypt

enigma = Enigma.new
enigma.encrypt(to_encrypt, KeyGenerator.make_master, OffsetGenerator.convert_date)

require "pry"; binding.pry

puts encrypted
