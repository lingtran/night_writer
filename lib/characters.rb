  CHARACTERS = {a: ["0.","..",".."],
                b: ["0,.","0.",".."],
                c: ["00","..",".."],
                d: ["00",".0",".."],
                e: ["0.",".0",".."],
                f: ["00","0.",".."],
                g: ["00","00",".."],
                h: ["0.","00",".."],
                i: [".0","0.",".."],
                j: [".0","00",".."],
                k: ["0.","..","0."],
                l: ["0.","0.","0."],
                m: ["00","..","0."],
                n: ["00",".0","0."],
                o: ["0.",".0","0."],
                p: ["00","0.","0."],
                q: ["00","00","0."],
                r: ["0.","00","0."],
                s: [".0","0.","0."],
                t: [".0","00","0."],
                u: ["0.","..","00"],
                v: ["0.","0.","00"],
                w: [".0","00",".0"],
                x: ["00","..","00"],
                y: ["00",".0","00"],
                z: ["0.",".0","00"],
                " ": ["..","..",".0"]
              }

  # def self.map
  #   # need to pair English letter with corresponding Braille letter
  #   # considering Hash of arrays
  #   # key = English letter; value = braille_a = [0,"."] [".","."], [".","."], possibly, such that positions 0-2 go on left, 3-5 go on right...how to iterate this?
  #   # methods to investigate: Array#each_index, Array#fetch, Array#join, Array#transpose
  #
  #
  #   braille = map[english]
  # end
