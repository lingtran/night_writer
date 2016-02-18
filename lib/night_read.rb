require 'pry'
require_relative 'message_reader'
require_relative 'characters'
require_relative 'numbers'

class NightReader
  include MessageReader

  def initialize
    decode_file_to_original_message(string = MessageReader::read)
  end

  def decode_to_original_message(string)
    # invert to extract
    transpose(string).
  end

  def parser(number, string)
    string.split[number].chars.each_with_index { |char, index| index == 0 ? char : index.even? ? char.prepend(" ") : char }.join.split

    # perhaps put this method and transpose in reader module?
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
    writer.write(string)
    writer.close
  end

end

NightReader.new
puts "Created '#{ARGV[1]}' containing #{ARGV[1].length} characters" if File.exists?(ARGV[1])
