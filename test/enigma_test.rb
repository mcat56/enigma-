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
    assert_equal  ({encryption: "keder ohulw!", key: "02715",date: "040895"} ) , @enigma.encrypt("Hello World!", "02715", "040895")
  end

  def test_decrypt_all_args

    assert_equal ( {decryption: "hello world", key: "02715",date: "040895" }), @enigma.decrypt("keder ohulw", "02715", "040895")
  end


  def test_encrypt_no_date_or_key
    date = mock
    key = mock
    date.stubs(:generate_date).returns("130919")
    key.stubs(:generate_key).returns("94204")

    assert_equal ({encryption: "yykqetvthec", key: "94204", date: "130919" }), @enigma.encrypt("hello world", key.generate_key, date.generate_date)
  end

  def test_encrypt_no_date
    date = mock
    date.stubs(:generate_date).returns("130919")
    assert_equal ( {encryption: "njhauesdxq ", key: "02715", date: "130919" }),  @enigma.encrypt("hello world", "02715", date.generate_date)

  end

  def test_decrypt_no_date
    date = mock
    date.stubs(:generate_date).returns("130919")
    assert_equal ({decryption: "hello world" , key: "02715", date: "130919"}), @enigma.decrypt("njhauesdxq ", "02715", date.generate_date)
  end

  def test_decrypt_from_encrypted
    date = mock
    date.stubs(:generate_date).returns("130919")
    @enigma.encrypt("hello world", "02715", date.generate_date)

    assert_equal ({decryption: "hello world" , key: "02715", date: "130919"}), @enigma.decrypt(@enigma.encrypted[:encryption], "02715", date.generate_date)
  end

  def test_crack
    assert_equal ({decryption: "hello world end", key: "08304", date: "291018"}), @enigma.crack("vjqtbeaweqihssi", "291018")
  end

  def test_crack_no_date
    date = mock
    date.stubs(:generate_date).returns("291018")
    assert_equal ({ decryption: "hello world end", key: "08304" , date: "291018"}), @enigma.crack("vjqtbeaweqihssi", date.generate_date)
  end


end
