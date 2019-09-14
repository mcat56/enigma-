require_relative 'test_helper'


class GenerateDateTest < MiniTest::Test

  def setup
    @gen_date = GenerateDate.new
  end

  def test_it_exists
    assert_instance_of GenerateDate, @gen_date
  end

  def test_generate_date
    date = GenerateDate.generate_date
    assert_match (/\d{6}/), date
  end

end
