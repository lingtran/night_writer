require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require '../lib/night_write'

class NightWriteTest < Minitest::Test
  def test_NightWriter_object_can_be_instantiated
    braille = NightWriter.new

    assert_equal NightWriter, braille.class
  end

  def test_write_file_can_be_created
    assert File.exists?(ARGV[1])
  end

  def def test_write_file_is_writable
    assert File.writable?(ARGV[1])
  end

  def test_read_file_is_readable
    assert File.readable?(ARGV[0])
  end

  def test_single_lowercase_letter_can_be_encoded_to_braille
    braille = NightWriter.new

    assert_equal "0.", braille.row_at(0,"h")
    assert_equal "00", braille.row_at(1,"h")
    assert_equal "..", braille.row_at(2,"h")

    assert_equal "0.\n00\n..", braille.encode_to_braille("h")
  end

  def test_single_lowercase_word_can_be_encoded_to_braille
    braille = NightWriter.new

    assert_equal "0..0", braille.row_at(0,"hi")
    assert_equal "000.", braille.row_at(1,"hi")
    assert_equal "....", braille.row_at(2,"hi")
  end

  def test_single_capitalized_word_can_be_encoded_to_braille
    braille = NightWriter.new

    assert_equal "..0..0", braille.row_at(0,"Hi")
    assert_equal "..000.", braille.row_at(1,"Hi")
    assert_equal ".0....", braille.row_at(2,"Hi")
  end

  def test_multiple_words_both_lowercase_and_uppercase_with_white_spaces_can_be_encoded_to_braille
    braille = NightWriter.new

    assert_equal "..0..0.....00.0.0.00", braille.row_at(0,"Hi World")
    assert_equal "..000.....00.0000..0", braille.row_at(1,"Hi World")
    assert_equal ".0.......0.00.0.0...", braille.row_at(2,"Hi World")

    assert_equal "..0..0.....00.0.0.00....000.0.", braille.row_at(0, "Hi World You")
    assert_equal "..000.....00.0000..0.....0.0..", braille.row_at(1, "Hi World You")
    assert_equal ".0.......0.00.0.0......0000.00", braille.row_at(2, "Hi World You")
  end

  def test_punctuation_can_be_encoded_to_braille
    braille = NightWriter.new

    assert_equal "....\n..00\n..0.", braille.encode_to_braille(" !")
    assert_equal "..0.0.0.0.0.......000.00..000.0...0.0.0.0...000.....00..0....0..\n..00.00.0..000.........0...0.0....00.0..00.....0.....0...0..000.\n.0....0.0.0.0....0....0...000.00........0...0......00..00..0.000", braille.encode_to_braille("Hello! Can you hear me NOW?")
  end

  def test_numbers_can_be_encoded_to_braille
    braille = NightWriter.new

    assert_equal ".00.\n.0..\n00..", braille.encode_to_braille("1")
    assert_equal ".00....00....0.0\n.0.....00....000\n00..0000..0000..", braille.encode_to_braille("1-2-0")
  end

  def test_can_line_wrap_to_honor_width_constraint_of_40_characters
    braille = NightWriter.new

    assert_equal ("0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n................................................................................\n................................................................................\n0.\n..\n.."), braille.line_wrap("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", line_length = 160)
  end
end
