require "./spec/spec_helper"

if ARGV.length < 2 || ARGV.length > 3
  puts "Please run with a file to encrypt,a location to encrypt to, and an optional encryption date"
  exit
end

input = ARGV[0]
output = ARGV[1]

to_decrypt = File.read(ARGV[0])

enigma = Enigma.new
ARGV[2] ? date = ARGV[2] : date = OffsetGenerator.convert_date
require "pry"; binding.pry
decrypted = enigma.crack(to_decrypt, date)[:encryption]

File.write(output, decrypted)
puts "Created '#{output}' with the key #{master_key} and date #{date}"
