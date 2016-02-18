require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require '../lib/night_read'

class NightReadTest < Minitest::Test
  def test_write_file_can_be_created
    assert File.exists?(ARGV[1])
  end

  def test_write_file_is_writable
    assert File.writable?(ARGV[1])
  end

  def test_single_line_in_braille_can_be_turned_into_an_array
    message = NightReader.new

    assert_equal ["0."], message.parser(0, "0.\n00\n..") # if this is top_row, each position in the array represents 0th position in corresponding character value

    assert_equal ["00"], message.parser(1, "0.\n00\n..")
    assert_equal [".."], message.parser(2, "0.\n00\n..")
  end

  def test_single_line_in_braille_can_be_assigned_to_row
    skip
    message = NightReader.new

    assert_equal ["0.", "00", ".."], row(0)
  end


  def test_single_upcase_braille_character_can_be_decoded_to_original
    skip
  end

  def test_lowercase_braille_word_can_be_decoded_to_original
    skip
  end

  def test_capitalized_braille_word_can_be_decoded_to_original
    skip
  end
end
