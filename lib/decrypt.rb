require 'test_helper'
require_relative '/modules/decrypt'

class Decrypt
  include Decrypt

  def initialize(decryption, key = generate_key, date = generate_date)
    @decrypted = {
      decryption: decryption,
      key: key,
      date: date
    }
  end

end


enigma = Enigma.new

handle = File.open(ARGV[0], "r")

encrypted = handle.read

handle.close

decrypted_txt = enigma.decrypt(encrypted,File.open(ARGV[2]),File.open(ARGV[3]))

writer = File.open(ARGV[1], "w")

writer.write(encrypted_txt)

writer.close


puts "Created #{File.open(ARGV[1])} with the key #{File.open(ARGV[2])} and date #{File.open(ARGV[3])}"
