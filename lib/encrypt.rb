require "./spec/spec_helper"

if ARGV.length != 2
  puts "Please run with a file to encrypt and a location to encrypt to"
  exit
end

input = ARGV[0]
output = ARGV[1]

to_encrypt = File.read(ARGV[0])

enigma = Enigma.new
master_key = KeyGenerator.make_master
date =  OffsetGenerator.convert_date
encrypted = enigma.encrypt(to_encrypt, master_key, date)[:encryption]

File.write(output, encrypted)
puts "Created '#{output}' with the key #{master_key} and date #{date}"
