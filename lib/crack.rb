require "./spec/spec_helper"

if ARGV.length < 2 || ARGV.length > 3
  puts "Please run with a file to encrypt,a location to encrypt to, and an optional encryption date"
  exit
end

input = ARGV[0]
output = ARGV[1]

to_decrypt = File.read(ARGV[0]).chomp

enigma = Enigma.new
ARGV[2] ? date = ARGV[2] : date = OffsetGenerator.convert_date


answer = enigma.crack(to_decrypt, date)
require "pry"; binding.pry
decrypted = answer[:decryption]
masterkey = answer[:key]

File.write(output, decrypted)
puts "Created '#{output}' with the key #{masterkey} and date #{date}"
