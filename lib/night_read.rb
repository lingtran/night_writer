# reads Braille and converts to normal English letters
# takes braille.txt (Braille simulation) -- outputs original_message.txt

class NightReader
  attr_accessor :file_reader

  def initialize(file_reader = ARGV[0])
    @file_reader = file_reader
  end

  def read
    File.read(file_reader)
  end

end
