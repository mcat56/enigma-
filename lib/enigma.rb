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


end
