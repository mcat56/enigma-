require_relative '../test/test_helper'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")

message = (handle.read).chomp

encrypted_txt = enigma.encrypt(message)

handle.close

writer = File.open(ARGV[1], "w")

writer.write(encrypted_txt[:encryption])

puts "Created '#{ARGV[1]}' with the key #{enigma.encrypted[:key]} and date #{enigma.encrypted[:date]}"

writer.close
