class Enigma
  include EncryptDecrypt
  attr_reader :encrypted

  def initialize
    @encrypted = {
      encryption: nil,
      key: nil,
      date: nil
    }
  end

  def encrypt(message, key = Key.generate_key, date = GenerateDate.generate_date)

  end

  def decrypt(encryption, key = Key.generate_key, date = GenerateDate.generate_date)
  end


end
