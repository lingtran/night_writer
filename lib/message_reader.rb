class MessageReader
  def self.read
    input = File.open(ARGV[0], "r")
    message = input.readlines
    input.close
    message
  end
end
