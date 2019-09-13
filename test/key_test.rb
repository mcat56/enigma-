require_relative 'test_helper'

class KeyTest < MiniTest::Test

  def setup
    @key = Key.new
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_initialize
    assert_equal "", @key.key
  end


  def test_generate_key
    key = Key.generate_key
    assert_match(/\d{5}/, key)
  end

end
