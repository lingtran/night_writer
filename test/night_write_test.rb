require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require '../lib/night_write'

class NightWriteTest < Minitest::Test
  def test_NightWriter_class_can_be_instantiated
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

  def test_single_lowercase_word_can_be_printed_in_braille
    braille = NightWriter.new

    assert_equal "0..0", braille.row_at(0,"hi")
    assert_equal "000.", braille.row_at(1,"hi")
    assert_equal "....", braille.row_at(2,"hi")
  end

  def test_single_capitalized_word_can_be_printed_in_braille
    braille = NightWriter.new

    assert_equal "..0..0", braille.row_at(0,"Hi")
    assert_equal "..000.", braille.row_at(1,"Hi")
    assert_equal ".0....", braille.row_at(2,"Hi")
  end

  def test_multiple_words_both_lowercase_and_uppcase_with_white_spaces_can_be_included_in_braille
    braille = NightWriter.new

    assert_equal "..0..0.....00.0.0.00", braille.row_at(0,"Hi World")
    assert_equal "..000.....00.0000..0", braille.row_at(1,"Hi World")
    assert_equal ".0.......0.00.0.0...", braille.row_at(2,"Hi World")

    assert_equal "..0..0.....00.0.0.00....000.0.", braille.row_at(0, "Hi World You")
    assert_equal "..000.....00.0000..0.....0.0..", braille.row_at(1, "Hi World You")
    assert_equal ".0.......0.00.0.0......0000.00", braille.row_at(2, "Hi World You")
  end

  def test_numbers_can_be_printed_in_braille
    skip
  end

  def test_write_file_format_constraint_to_80_characters_is_observed
    skip
  end
end
