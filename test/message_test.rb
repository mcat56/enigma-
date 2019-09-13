require_relative 'test_helper'

class MessageTest < Minitest::Test

  def setup
    @message = Message.new('message.txt')
  end

  def test_it_exists
    assert_instance_of Message, @message
  end

  def test initialize(file)
    @filename = file
    @text = ""
  end

  def test_read
    @message.read('message.txt')
    assert_equal "Life is Beautiful", @message.text
  end
