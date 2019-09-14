require_relative 'test_helper'

class EnigmaTest < MiniTest::Test

  def setup
    @enigma = Enigma.new
    @encrypted = {encryption: "weaog mbord", key: "90193", date: "120919"}
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_initialize
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "], @enigma.alphabet
    assert_equal ({}), @enigma.encrypted
  end

  def test_generate_keys
    @enigma.encrypt("hello world", "90193", "120919")
    assert_equal [90,1,19,93], @enigma.generate_keys(@enigma.encrypted[:key])
  end

  def test_generate_offsets
    @enigma.encrypt("hello world", "90193", "120919")

    assert_equal [4,5,6,1], @enigma.generate_offsets(@enigma.encrypted[:date])
  end

  def test_generate_shifts
    @enigma.encrypt("hello world", "90193", "120919")
    assert_equal [94,6,25,94], @enigma.generate_shifts(@enigma.encrypted[:key],@enigma.encrypted[:date])
  end

  def test_encrypt_all_args
    assert_equal  ({encryption: "keder ohulw", key: "02715",date: "040895"} ) , @enigma.encrypt("Hello World", "02715", "040895")
  end

  def test_decrypt_all_args

    assert_equal ( {decryption: "hello world",key: "02715",date: "040895" }), @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_encrypt_no_date_or_key
    date = mock
    number = mock
    date.stubs(:generate_date).returns("120919")
    number.stubs(:generate_key).returns("02715")

    assert_equal ({encryption:     , key: @enigma.key, date: @enigma.date}), @enigma.encrypt("hello world")
  end




end

  # def test_encrypt_no_date_or_key
  #   date = mock
  #   number = mock
  #   date.stubs(:generate_date).returns("120919")
  #   number.stubs(:generate_key).returns("02715")
  #
  #   assert_equal ({encryption:     , key: @enigma.key, date: @enigma.date}), @enigma.encrypt("hello world")
  # end
  #
  # def test_encrypt_no_date
  #   date = mock
  #   date.stubs(:generate_date).returns("120919")
  #   assert_equal ( {encryption:     , key: "02715", date: @enigma.data }),  @enigma.encrypt("hello world", "02715")
  # end
  #
  # def test_decrypt_no_date
  #   encrypted = ({encryption: "keder ohulw", key: "02715",date: "040895"})
  #   date = mock
  #   date.stubs(:generate_date).returns("120919")
  #   assert_equal ({decryption:     , key: "02715", date: @enigma.date}), @enigma.decrypt(encrypted[:encryption], "02715")
  # end
  # #
  # def test_crack
  #   encrypted = {encryption: "vjqtbeaweqihssi", key: "08304", date: "291018"}
  #
  #   assert_equal ({decryption: "hello world end",date: "291018",key: "08304"}), @enigma.crack("vjqtbeaweqihssi","291018")
  # end
  #
  # def test_crack_no_date
  #   assert_equal ({ decryption: "hello world end",date: DDMMYY, key: key }), @engima.crack("vjqtbeaweqihssi")
  # end
  #
