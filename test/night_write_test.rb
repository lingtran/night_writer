require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require '../lib/night_write'

class NightWriteTest < Minitest::Test
  def test_write_file_can_be_created
    assert File.exists?(ARGV[1])
  end

  def test_file_can_be_read
    reader = MessageReader::read.chomp
    assert_equal "abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ", reader
  end

  def test_single_lowercase_word_can_be_printed_in_braille
    braille = NightWriter.new

    assert_equal "0..0", braille.row(0,"hi")
    assert_equal "000.", braille.row(1,"hi")
    assert_equal "....", braille.row(2,"hi")
  end

  def test_single_capitalized_word_can_be_printed_in_braille
    braille = NightWriter.new

    assert_equal "..0..0", braille.row(0,"Hi")
    assert_equal "..000.", braille.row(1,"Hi")
    assert_equal ".0....", braille.row(2,"Hi")
  end

  def test_white_spaces_can_be_included_in_braille
    braille = NightWriter.new

    assert_equal "..0..0.....00.0.0.00", braille.row(0,"Hi World")
    assert_equal "..000.....00.0000..0", braille.row(1,"Hi World")
    assert_equal ".0.......0.00.0.0...", braille.row(2,"Hi World")

    assert_equal "..0..0.....00.0.0.00....000.0.", braille.row(0, "Hi World You")
    assert_equal "..000.....00.0000..0.....0.0..", braille.row(1, "Hi World You")
    assert_equal ".0.......0.00.0.0......0000.00", braille.row(2, "Hi World You")
  end

  def test_numbers_can_be_printed_in_braille
    skip
  end

  def test_file_can_be_encoded_to_braille
    skip
    # tips for how to write test for this?
  end

end
