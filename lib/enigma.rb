require_relative 'decryption'
require_relative 'message'
require_relative 'encryption'

class Enigma
  include EncryptDecrypt
  attr_reader :encrypted

  def initialize
    @enrypt = Encrypt.new
    @decrypt = Decrypt.new
    @encrypted = {
      encryption: nil,
      key: nil,
      date: nil
    }
  end


end
