# Remaining to do:
# define format so that width of txt file constrained to 80 Braille chracter (160 dots)
# tackle numbers extension

require 'pry'
require_relative 'message_reader'
require_relative 'characters'
require_relative 'numbers'

class NightWriter
  include MessageReader

  def initialize
    encode_file_to_braille(string = MessageReader::read.chomp)
  end

  def encode_to_braille(string)
    top_row = row_at(0, string)
    middle_row = row_at(1, string)
    bottom_row = row_at(2, string)

    "#{top_row}\n#{middle_row}\n#{bottom_row}"
  end

  def row_at(number, string)
    string.chars.map do |char|
      if char == " "
        char.gsub!(" ", "..")
      elsif char == char.capitalize
        CHARACTERS[:shift][number] + CHARACTERS[char.downcase.to_sym][number]
      else
       CHARACTERS[char.to_sym][number]
      end
    end.join

    # so far only handled single line text, error when include a second line in message
  end

  def encode_file_to_braille(string)
    writer = File.open(ARGV[1], "w")
    writer.write(encode_to_braille(string)) #append
    writer.close
  end
  
  # need char_count method for ARGV[1]
end

NightWriter.new
puts "Created '#{ARGV[1]}' containing #{ARGV[1].length} characters" if File.exists?(ARGV[1])
# character count is incorrect - need to define method!
