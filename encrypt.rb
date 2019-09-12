require 'test_helper'
require_relative '/modules/encrypt'

enigma = Enigma.new

handle = File.open(ARG[0], "r")

message = handle.read

handle.close

encrypted_txt = enigma.encrypt(message,enigma.key,enigma.date)

writer = File.open(ARGV[1], "w")

writer.write(encrypted_txt)

writer.close
