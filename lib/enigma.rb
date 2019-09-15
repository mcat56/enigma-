class Enigma
  attr_reader :encrypted, :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
    @encrypted = {}
  end

  def encrypt(message, key = Key.generate_key , date = GenerateDate.generate_date )
    @encrypted = {encryption: message.downcase, key: key }
    if key.length == 6
      @encrypted[:date] = key
    else
      @encrypted[:date] = date
    end
    @encryption = Encryption.new(@encrypted[:encryption],@encrypted[:key],@encrypted[:date])
    @encrypted[:encryption] = shift(message.downcase,key,date,false)
    @encrypted
  end

  def decrypt(cipher, key = Key.generate_key, date = GenerateDate.generate_date)
    @decryption = Decryption.new(cipher,key,date)

    {decryption: shift(cipher,key,date,true), key: key, date: date}
  end

  def crack(cipher, date = GenerateDate.generate_date)
    keys = (00000..99999).to_a.map {|num| num.to_s.rjust(5,"0") }

    selected_key = keys.select { |key| decrypt(cipher,key,date)[:decryption][-4..-1] == " end" }[0]

    {decryption: decrypt(cipher,selected_key,date)[:decryption], key: selected_key, date: decrypt(cipher,selected_key,date)[:date] }
  end

  def generate_keys(key)
    keys = [(key[0] + key[1]).to_i, (key[1] + key[2]).to_i, key_C = (key[2] + key[3]).to_i, key_D = (key[3] + key[4]).to_i]
  end

  def generate_offsets(date)
    offset = (date.to_i**2).to_s[-4..-1]
    offset.split("").map {|num| num.to_i }
  end

  def generate_shifts(key,date)
    generate_keys(key).zip(generate_offsets(date)).map {|array| array.sum}.flatten
  end

  def shift(text,key,date,boolean)
    shifts = generate_shifts(key, date)
    message = text.split("").each do |letter|
        shift = shifts[0]
        shift = (shifts[0] * -1) if boolean == true
      shifted = @alphabet.rotate(shift)
      if '!"#$%&\'()*+,-./:;<=>?@[\]^_`{|}~'.include? letter
        letter = letter
      else
        letter.replace(shifted[@alphabet.index(letter)])
      end
      shifts.rotate!
    end
    message.join
  end




end
