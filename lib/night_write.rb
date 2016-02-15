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

  def initialize
    encode_file_to_braille
  end

  def encode_to_braille
    MessageReader.read.cycle(3) do |line|
      puts line
    end.reduce("") do |braille, line|
      braille += "#{line}"
    end 
  end

  def encode_file_to_braille
    writer = File.open(ARGV[1], "w")
    writer.write(encode_to_braille)
    writer.close
  end

  # need char_count method for ARGV[1]

end

NightWriter.new
puts "Created '#{ARGV[1]}'"
