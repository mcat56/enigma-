require_relative 'test_helper'

class EnigmaTest < MiniTest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance of Enigma, @enigma
  end

  def test_initialize
    date = date
    key = mock
    date.stubs(:generate_date).returns("120919")
    key.stubs(:generate_key).returns("02461")

    assert_equal date, @enigma.date
    assert_equal number, @enigma.number
  end


  def test_encrypt_all_args

    assert_equal  ({encryption: "keder ohulw", key: "02715",date: "040895"} ) , @engima.encrypt("Hello World", "02715", "040895")
  end


  def test_decrypt_all_args

    assert_equal ( {decryption: "hello world",key: "02715",date: "040895" }), @engima.decrypt("keder ohulw", "02715", "040895")
  end

  def test_encrypt_no_date_or_key
    date = mock
    number = mock
    date.stubs(:generate_date).returns("120919")
    number.stubs(:generate_key).returns("02715")

    assert_equal ({encryption:     , key: @enigma.key, date: @enigma.date}), @enigma.encrypt("hello world")

  def test_encrypt_no_date
    date = mock
    date.stubs(:generate_date).returns("120919")
    assert_equal ( {encryption:     , key: "02715", date: @enigma.data }),  @enigma.encrypt("hello world", "02715")
  end

  def test_decrypt_no_date
    encrypted = ({encryption: "keder ohulw", key: "02715",date: "040895"})
    date = mock
    date.stubs(:generate_date).returns("120919")
    assert_equal ({decryption:     , key: "02715", date: @enigma.date}), @enigma.decrypt(encrypted[:encryption], "02715")
  end


end
