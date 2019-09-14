require_relative 'test_helper'

class DecryptionTest < Minitest::Test

  def setup
    @decrypt = Decrypt.new(encryption,key,date)
  end

end
