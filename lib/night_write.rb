# takes message.txt and creates braille.txt; reads normal alphabet and converts to Braille
# $ ruby ./lib/night_write.rb message.txt braille.txt
# => Created 'braille.txt' containing 256 characters
# Then work to:
# Pull the specified output filename from the command line arguments and print it in the terminal
# Get the actual number of characters from the message.txt and output it in the terminal
# Braille-simulation file will need three lines of output for every one line of output

# Remaining to do:
# map English alpahbet to Braille alphabet, including character support
# enable echoing
# define format so that width of txt file constrained to 80 Braille chracter (160 dots)
# tackle an extension

require 'pry'
require_relative 'message_reader'

class NightWriter
  include MessageReader
  def initialize
    encode_file_to_braille
  end

  def encode_to_braille
    braille = ""
    braille << MessageReader::read.map do |line|
      line * 3# translation will occur here
    end.join
  end

  def encode_file_to_braille
    writer = File.open(ARGV[1], "w")
    writer.write(encode_to_braille)
    writer.close
  end

  # need char_count method for ARGV[1]

end

NightWriter.new
puts "Created '#{ARGV[1]}' containing #{ARGV[1].length} characters" if File.exists?(ARGV[1])
# character count is incorrect - need to define method!
