require_relative 'test_helper'

class EncryptionTest < Minitest::Test

  def setup
    @encrypt = Encrypt.new(message,key,date)
  end

end
