module MessageReader
  def read
    input = File.open(ARGV[0], "r") # instruct to open
    input.readlines # instruct to read
    input.close # instruct to close
  end
end
