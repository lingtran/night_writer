# Remaining to do:
# successful test for formatting to meet width constraint of 80 Braille characters (160 dots)
# numbers = can utilize switch key, but not yet in accurate Braille convention
# can only handle single line input right now

require 'pry'
require_relative 'message_reader'
require_relative 'characters'

class NightWriter
  include MessageReader
  attr_reader :char_count

  def initialize
    encode_file_to_braille(string = MessageReader::read.chomp)
    @char_count = encode_to_braille(string).to_s.length
  end

  def row_at(number, string)
     string.chars.map do |char|
      if char == " "
        CHARACTERS[:" "][number]
      elsif char == "!"
        CHARACTERS[:"!"][number]
      elsif char == ","
        CHARACTERS[:","][number]
      elsif char == "-"
        CHARACTERS[:"-"][number]
      elsif char == "."
        CHARACTERS[:"."][number]
      elsif char == "?"
        CHARACTERS[:"?"][number]
      elsif char.ord >= 48 && char.ord <= 57
        CHARACTERS[:switch][number] + CHARACTERS[char.to_sym][number]
      elsif char == char.capitalize
        CHARACTERS[:shift][number] + CHARACTERS[char.downcase.to_sym][number]
      else
        CHARACTERS[char.to_sym][number]
      end
    end.join
  end

  def encode_to_braille(string)
    top_row = row_at(0, string)
    middle_row = row_at(1, string)
    bottom_row = row_at(2, string)
    "#{top_row}\n#{middle_row}\n#{bottom_row}"
  end

  def line_wrap(string, line_length = 160)
    encode_to_braille(string).length < line_length ?
    encode_to_braille(string) :
    encode_to_braille(string).scan(/.{1,#{line_length}}/).join
  end

  def encode_file_to_braille(string)
    writer = File.open(ARGV[1], "w")
    writer.write(line_wrap(string, line_length = 160))
    writer.close
  end
end

NightWriter.new
puts "Created '#{ARGV[1]}' containing #{NightWriter.new.char_count} characters" if File.exists?(ARGV[1])
