class CharacterReader {

  class func read(_ sevenSegmentCharacter: String) -> UInt? {
    guard sevenSegmentCharacter.characters.count > 0 else {
      return nil
    }

    let charLines = sevenSegmentCharacter.characters.split {
      $0 == "\n"
    }

    let bits = sevenSegmentBits(charLines)

    if bits == 63 {
      return 0
    } else if bits == 6 {
      return 1
    } else if bits == 91 {
      return 2
    } else if bits == 79 {
      return 3
    } else if bits == 102 {
      return 4
    } else if bits == 109 {
      return 5
    } else if bits == 125 {
      return 6
    } else if bits == 7 {
      return 7
    } else if bits == 127 {
      return 8
    } else if bits == 111 {
      return 9
    }

    return nil
  }

  private class func sevenSegmentBits(_ lines: [String.CharacterView]) -> Int {
    var bits = 0

    for (lineNumber, line) in lines.enumerated() {
      for (charNumber, char) in line.enumerated() {

        if lineNumber == 0 && charNumber == 1 && char == "_" {
          bits |= 1
        }

        if lineNumber == 1 {
          if charNumber == 0 && char == "|" {
            bits |= 32
          }
          if charNumber == 1 && char == "_" {
            bits |= 64
          }
          if charNumber == 2 && char == "|" {
            bits |= 2
          }
        }

        if lineNumber == 2 {
          if charNumber == 0 && char == "|" {
            bits |= 16
          }
          if charNumber == 1 && char == "_" {
            bits |= 8
          }
          if charNumber == 2 && char == "|" {
            bits |= 4
          }
        }
      }
    }
    return bits
  }

}
