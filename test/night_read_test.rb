require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require '../lib/night_read'

class NightReadTest < Minitest::Test
  def test_NightReader_object_can_be_instantiated
    message = NightReader.new

    assert_equal NightReader, message.class
  end

  def test_write_file_can_be_created
    assert File.exists?(ARGV[1])
  end

  def test_write_file_is_writable
    assert File.writable?(ARGV[1])
  end

  def test_read_file_is_readable
    assert File.readable?(ARGV[0])
  end

  def test_lines_of_single_braille_letter_can_be_turned_into_an_array_with_their_index_reflecting_row_position_in_braille
    message = NightReader.new

    assert_equal ["0."], message.parse_at(0, "0.\n00\n..")
    assert_equal ["00"], message.parse_at(1, "0.\n00\n..")
    assert_equal [".."], message.parse_at(2, "0.\n00\n..")
  end

  def test_parser_rows_can_be_transposed_to_make_an_aggregate_array
    message = NightReader.new
    string = "0.\n00\n.."

    message.parse_at(0, string)
    message.parse_at(1, string)
    message.parse_at(2, string)
    assert_equal [["0.", "00", ".."]], message.transpose(string)
  end

  def test_lowercase_braille_letter_can_be_decoded_to_original
    message = NightReader.new
    string = "0.\n00\n.."

    message.parse_at(0, string)
    message.parse_at(1, string)
    message.parse_at(2, string)
    message.transpose(string)
    assert_equal "h",message. decode_to_original_message(string)
  end

  def test_single_lowercase_word_can_be_decoded_to_original
    message = NightReader.new
    string = "0..0\n000.\n...."

    message.parse_at(0, string)
    message.parse_at(1, string)
    message.parse_at(2, string)
    message.transpose(string)
    assert_equal "hi",message. decode_to_original_message(string)
  end

  def test_single_upcase_braille_character_can_be_decoded_to_original
    message = NightReader.new
    string = "..0.\n..00\n.0.."

    message.parse_at(0, string)
    message.parse_at(1, string)
    message.parse_at(2, string)
    message.transpose(string)
    assert_equal "H",message.decode_to_original_message(string)
  end

  def test_single_capitalized_braille_word_can_be_decoded_to_original
    message = NightReader.new
    string = "..0..0\n..000.\n.0...."

    message.parse_at(0, string)
    message.parse_at(1, string)
    message.parse_at(2, string)
    message.transpose(string)
    assert_equal "Hi",message.decode_to_original_message(string)
  end

  def test_single_braille_word_in_caps_can_be_decoded_to_original
    message = NightReader.new
    string = "..0....0\n..00..0.\n.0...0.."

    message.parse_at(0, string)
    message.parse_at(1, string)
    message.parse_at(2, string)
    message.transpose(string)
    assert_equal "HI",message.decode_to_original_message(string)
  end

  def test_single_braille_word_with_second_letter_capitalized_can_be_decoded_to_original
    message = NightReader.new
    string = "0....0\n00..0.\n...0.."

    message.parse_at(0, string)
    message.parse_at(1, string)
    message.parse_at(2, string)
    message.transpose(string)
    assert_equal "hI",message.decode_to_original_message(string)
  end
end
