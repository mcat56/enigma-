require_relative 'test_helper'

class GenerateKeyTest < MiniTest::Test

  def setup
    @generate_key = GenerateKey.new
  end

  def test_it_exists
    assert_instance_of GenerateKey, @generate_key
  end

  def test_initialize
    assert_equal "", @generate_key.key
  end


  def test_generate_key
    @generate_key.generate_key
    assert_match(/\d{5}/, "12345")
  end

end
