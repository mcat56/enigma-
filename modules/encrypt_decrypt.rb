module EncryptDecrypt

  def generate_keys
    key = @encrypted[:key].split.map {|num| num.to_i}
    key_A = keys[0] + keys[1]
    key_B = key[1] + key[2]
    key_C = key[2] + key[3]
    key_D = key[3] + key[4]
    keys = [key_A, key_B,key_C, key_D]
  end

  def generate_offsets
    offset = (@encrypted[:date].to_i**2).to_s[-4..-1]
    offset_A = offset[0].to_i
    offset_B = offset[1].to_i
    offset_C = offset[2].to_i
    offset_D = offset[3].to_i
    offsets = [offset_A, offset_B, offset_C, offset_D]
  end



  def encrypt(message, key = Key.generate_key, date = GenerateDate.generate_date)
    @encrypted[:encryption] = message
    @encrypted[:key] = key
    @encrypted[:date] = date
  end

  def decrypt(encryption, key = Key.generate_key, date = GenerateDate.generate_date)
  end



end
