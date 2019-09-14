class Decryption
  attr_reader :cipher, :key, :date

  def initialize(cipher,key,date)
    @cipher = cipher
    @key = key
    @date = date
  end

end
