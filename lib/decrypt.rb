require_relative '../test/test_helper'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")

encrypted = (handle.read).chomp

decrypted_txt = enigma.decrypt(encrypted,ARGV[2],ARGV[3])

handle.close

writer = File.open(ARGV[1], "w")

writer.write(decrypted_txt[:decryption])

writer.close

puts "Created '#{ARGV[1]}' with the key #{decrypted_txt[:key]} and date #{decrypted_txt[:date]}"
