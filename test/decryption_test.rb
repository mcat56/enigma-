require_relative 'test_helper'

class DecryptionTest < Minitest::Test

  def setup
    @decrypt = Decrypt.new(message,key,date)
  end

end 
