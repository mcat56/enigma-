require_relative 'decryption'
require_relative 'encryption'

class Enigma
  attr_reader :encrypted, :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
    @encrypted = {}
  end

  def encrypt(message, key = Key.generate_key , date = GenerateDate.generate_date )
    @encrypted[:encryption] = message.downcase
    @encrypted[:key] = key
    if key.length == 6
      @encrypted[:date] = key
    else
      @encrypted[:date] = date
    end
      @encryption = Encryption.new(@encrypted[:encryption],@encrypted[:key],@encrypted[:date])
      shift
  end

  def decrypt(encryption, key = Key.generate_key, date = GenerateDate.generate_date)
    @decryption = decryption.new(encryption, key, date)
  end

  def crack(message, date = GenerateDate.generate_date)
    nil
  end

  def generate_keys
    key = @encrypted[:key].split("")
    key_A = (key[0] + key[1]).to_i
    key_B = (key[1] + key[2]).to_i
    key_C = (key[2] + key[3]).to_i
    key_D = (key[3] + key[4]).to_i
    keys = [key_A, key_B, key_C, key_D]
  end

  def generate_offsets
    offset = (@encrypted[:date].to_i**2).to_s[-4..-1]
    offset_A = offset[0].to_i
    offset_B = offset[1].to_i
    offset_C = offset[2].to_i
    offset_D = offset[3].to_i
    offsets = [offset_A, offset_B, offset_C, offset_D]
  end

  def generate_shifts
    generate_keys.zip(generate_offsets).map {|array| array.sum}.flatten
  end

  def shift
    shifts = generate_shifts
    encrypted = @encrypted[:encryption].split("").each do |letter|
    shift = shifts[0]
    shifted = @alphabet.rotate(shift)
      if ' !"#$%&\'()*+,-./:;<=>?@[\]^_`{|}~'.include? letter
        letter = letter
      else
        letter.replace(shifted[@alphabet.index(letter)])
      end
      shifts.rotate!
    end
    @encrypted[:encryption] = encrypted.join.strip
    @encrypted
  end




end
