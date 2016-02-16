module CharacterMap
  def self.lowercase
    # need to pair English letter with corresponding Braille letter
    # considering Hash of arrays
    # key = English letter; value = braille_a = [0,".",".",".",".","."], possibly, such that positions 0-2 go on left, 3-5 go on right...how to iterate this?
    # methods to investigate: Array#each_index, Array#fetch, Array#join
  end
end
