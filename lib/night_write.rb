# takes message.txt and creates braille.txt; reads normal alphabet and converts to Braille
# $ ruby ./lib/night_write.rb message.txt braille.txt
# => Created 'braille.txt' containing 256 characters
# Then work to:
# Pull the specified output filename from the command line arguments and print it in the terminal
# Get the actual number of characters from the message.txt and output it in the terminal
# Braille-simulation file will need three lines of output for every one line of output

require 'pry'

require_relative 'message_reader'

class NightWriter
  include MessageReader
  def initialize
    encode_file_to_braille
  end

  def encode_to_braille
    @braille = MessageReader::read.each do |line|
      puts (line + "\n") * 3
    end
  end

  def encode_file_to_braille
    writer = File.open(ARGV[1], "w")
    writer.write(@braille)
    writer.close
  end

  # need char_count method for ARGV[1]

end

NightWriter.new
puts "Created '#{ARGV[1]}'"
