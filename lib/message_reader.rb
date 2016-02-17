module MessageReader
  def self.read
    input = File.open(ARGV[0], "r")
    message = input.read
    input.close
    message
  end
end
