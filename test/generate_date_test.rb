require_relative 'test_helper'


class GenerateDateTest < MiniTest::Test

  def setup
    @generate_date = GenerateDate.new
  end

  def test_it_exists
    assert_instance_of GenerateDate, @generate_date
  end

  def test_initialize
    assert_equal "", @generate_date.date
  end

  def test_generate_date
    @generate_date.generate_date
    assert_match(/\d{6}/ , @generate_date.date)
  end
end
