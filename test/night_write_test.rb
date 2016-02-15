require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require '../lib/night_write'

class NightWriteTest < Minitest::Test
  def test_file_reader_can_be_instantiated
    assert FileReader.new
  end

  def test_file_can_be_read
    skip
    reader = FileReader.new
    assert_equal ["hello world\n", "this\n"], reader.read("message.txt")
  end

  def test_file_can_be_written
    skip
  end

  def test_file_can_be_encoded_to_braille
    skip
  end

  def test_message_file_can_create_braille_file
    skip
  end

  def test_input_can_be_encoded_to_braille
    skip
  end

  def test_file_argument_can_be_inspected
    skip
  end

end
