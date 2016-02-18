# remaining to do:
# account for white spaces
# define format so that width of txt file constrained to 80 Braille characters (160 dots)
# numbers extension
# character count (optional?), likely able to figure out while doing formatting

require 'pry'
require_relative 'message_reader'
require_relative 'characters'
require_relative 'numbers'

class NightReader
  include MessageReader

  def initialize
    decode_file_to_original_message(string = MessageReader::read.chomp)
  end

  def decode_to_original_message(string)
    transpose(string).map { |element| CHARACTERS.key(transpose(string).fetch(transpose(string).index(element)-1)) == :shift ?  CHARACTERS.key(element).to_s.upcase : CHARACTERS.key(element) == :shift ? transpose(string).reject { |element| transpose(string).fetch(transpose(string).index(element)) } : CHARACTERS.key(element).to_s }.join
  end

  def parser(number, string)
    string.split[number].chars.each_with_index { |char, index| index == 0 ? char : index.even? ? char.prepend(" ") : char }.join.split
  end

  def transpose(string)
    top_row = parser(0, string)
    middle_row = parser(1, string)
    bottom_row = parser(2, string)

    aggregate_row = Array.new
    aggregate_row.push(top_row, middle_row, bottom_row).transpose
  end

  def decode_file_to_original_message(string)
    writer = File.open(ARGV[1], "w")
    writer.write(decode_to_original_message(string))
    writer.close
  end
end

NightReader.new
puts "Created '#{ARGV[1]}' containing some number of characters" if File.exists?(ARGV[1])
