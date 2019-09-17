require_relative 'shift'

class Enigma < Shift
  attr_reader :encrypted

  def initialize
    @encrypted = {}
    @shift = Shift.new
  end

  def encrypt(message, key = Key.generate_key , date = GenerateDate.generate_date )
    @encrypted = {encryption: message.downcase}
    if key.length == 6
      @encrypted[:key] = Key.generate_key
      @encrypted[:date] = key
    else
      @encrypted[:key] = key
      @encrypted[:date] = date
    end
    @encrypted[:encryption] = @shift.shift(message.downcase,key,date,false)
    @encrypted
  end

  def decrypt(cipher, key = Key.generate_key, date = GenerateDate.generate_date)

    {decryption: @shift.shift(cipher,key,date,true), key: key, date: date}
  end

  def crack(cipher, date = GenerateDate.generate_date)
    keys = (00000..99999).to_a.map {|num| num.to_s.rjust(5,"0") }

    selected_key = keys.select { |key| decrypt(cipher,key,date)[:decryption][-4..-1] == " end" }[0]

    {decryption: decrypt(cipher,selected_key,date)[:decryption],
     key: selected_key,
     date: decrypt(cipher,selected_key,date)[:date] }
  end



end
