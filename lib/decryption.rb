class Decryption
  attr_reader :decryption, :key, :date

  def initialize(decryption,key,date)
    @decryption = decryption
    @key = key
    @date = date
  end

end
