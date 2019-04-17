require "./spec/spec_helper"

if ARGV.length != 4
  puts "Please run with a file to encrypt,a location to encrypt to, a key, and a date in ddmmyy format"
  exit
end

input = ARGV[0]
output = ARGV[1]

to_decrypt = File.read(ARGV[0])

enigma = Enigma.new
master_key = ARGV[2]
date =  ARGV[3]
decrypted = enigma.decrypt(to_decrypt, master_key, date)[:decryption]
File.write(output, decrypted)
puts "Created '#{output}' with the key #{master_key} and date #{date}"
