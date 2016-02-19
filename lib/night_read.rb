# issue with numbers support, will return letter rather than number
# can't handle multi-line input text as well as consecutive letters in CAPS consistently

require 'pry'
require_relative 'message_reader'
require_relative 'characters'

class NightReader
  include MessageReader
  attr_reader :char_count

  def initialize
    decode_file_to_original_message(string = MessageReader::read.chomp)
    @char_count = decode_to_original_message(string).to_s.length
  end

  def parse_at(number, string)
    string.split[number].chars.each_with_index { |char, index| index == 0 ? char : index.even? ? char.prepend(" ") : char }.join.split
  end

  def transpose(string)
    top_row = parse_at(0, string)
    middle_row = parse_at(1, string)
    bottom_row = parse_at(2, string)

    aggregate_row = Array.new
    aggregate_row.push(top_row, middle_row, bottom_row).transpose
  end

  def decode_to_original_message(string)
    transpose(string).map do |element|
      if CHARACTERS.key(transpose(string).fetch(transpose(string).index(element)-1)) == :shift
        CHARACTERS.key(element).to_s.upcase
      elsif CHARACTERS.key(element) == :shift || CHARACTERS.key(element) == :switch
        transpose(string).reject { |element| transpose(string).fetch(transpose(string).index(element)) }
      elsif CHARACTERS.key(transpose(string).fetch(transpose(string).index(element)-1)) == :switch
        CHARACTERS.key(element).to_s
      else
        CHARACTERS.key(element).to_s
      end
    end.join
  end

  def line_wrap(string, line_length = 40)
    decode_to_original_message(string).length < line_length ?
    decode_to_original_message(string) :
    decode_to_original_message(string).scan(/.{1,#{line_length}}/).join("\n")
  end

  def decode_file_to_original_message(string)
    writer = File.open(ARGV[1], "w")
    writer.write(line_wrap(string, line_length = 40))
    writer.close
  end
end

message = NightReader.new
puts "Created '#{ARGV[1]}' containing #{message.char_count} characters" if File.exists?(ARGV[1])
