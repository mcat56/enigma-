

enigma = Enigma.new

handle = File.open(ARGV[0], "r")

encrypted = handle.read

handle.close

decrypted_txt = enigma.decrypt(encrypted,File.open(ARGV[2]),File.open(ARGV[3]))

writer = File.open(ARGV[1], "w")

writer.write(encrypted_txt)

writer.close


puts "Created #{File.open(ARGV[1])} with the key #{File.open(ARGV[2])} and date #{File.open(ARGV[3])}"
