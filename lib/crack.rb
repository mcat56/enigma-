require_relative '../test/test_helper'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")

encrypted = (handle.read).chomp

decrypted_txt = enigma.crack(encrypted, ARGV[2])

handle.close

writer = File.open(ARGV[1], "w")

writer.write(decrypted_txt[:decryption])

writer.close

puts "Created '#{ARGV[1]}' with the cracked key #{decrypted_txt[:key]} and date #{decrypted_txt[:date]}"
