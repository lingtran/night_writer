require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require '../lib/night_read'

class NightReadTest < Minitest::Test
  def test_write_file_can_be_created
    assert File.exists?(ARGV[1])
  end

  def test_single_lowercase_braille_character_can_be_written_to_original
    skip
  end

  def test_single_upcase_braille_character_can_be_written_to_original
    skip
  end

  def test_lowercase_braille_word_can_be_written_to_original
    skip
  end

  def test_capitalized_braille_word_can_be_written_to_original
    skip
  end
end
