require 'pry'
require_relative 'message_reader'
require_relative 'characters'
require_relative 'numbers'

class NightReader
  include MessageReader

  def initialize
    encode_file_to_original(string = MessageReader::read)
  end

  def encode_to_original_message(string)

  end

  def row(number, string)
    # string.chars.map do |char|
    #   if char == " "
    #     char.gsub!(" ", "..")
    #   elsif char == char.capitalize
    #     CHARACTERS[:shift][number] + CHARACTERS[char.downcase.to_sym][number]
    #   else
    #    CHARACTERS[char.to_sym][number]
    #   end
    # end.join
  end

  def encode_file_to_original_message(string)
    writer = File.open(ARGV[1], "w")
    writer.write(string)
    writer.close
  end

end

NightReader.new
puts "Created '#{ARGV[1]}' containing #{ARGV[1].length} characters" if File.exists?(ARGV[1])
