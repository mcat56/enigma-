require_relative 'test_helper'
require_relative '../lib/enigma'


class EnigmaTest < MiniTest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance of Enigma, @enigma
  end

  def test_initialize
    date = mock
    number = mock
    date.stubs(:generate_date).returns("120919")
    number.stubs(:generate_number).returns("02461")

    assert_equal date, @enigma.date
    assert_equal number, @enigma.number
  end


  def test_encrypt
    date = mock
    number = mock
    date.stubs(:generate_date).returns("120919")
    number.stubs(:generate_number).returns("02461")


    assert_equal  ({encryption: "keder ohulw", key: "02715",date: "040895"} ) , @engima.encrypt("Hello World", "02715", "040895")
  end


  def test_decrypt


    assert_equal ( {decryption: "hello world",key: "02715",date: "040895" }), @engima.decrypt("keder ohulw", "02715", "040895")
  end

end














end
