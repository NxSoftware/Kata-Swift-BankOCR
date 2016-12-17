class CharacterReader {

  class func read(_ sevenSegmentCharacter: String) -> UInt? {
    guard sevenSegmentCharacter.characters.count > 0 else {
      return nil
    }

    let charLines = sevenSegmentCharacter.characters.split {
      $0 == "\n"
    }

    var bits = 0

    for (lineNumber, line) in charLines.enumerated() {
      for (charNumber, char) in line.enumerated() {

        if lineNumber == 0 && charNumber == 1 && char == "_" {
          bits |= 4
        }

        if lineNumber == 1 {
          if charNumber == 1 && char == "_" {
            bits |= 16
          }
          if charNumber == 2 && char == "|" {
            bits |= 2
          }
        }

        if lineNumber == 2 {
          if charNumber == 0 && char == "|" {
            bits |= 32
          }
          if charNumber == 1 && char == "_" {
            bits |= 64
          }
          if charNumber == 2 && char == "|" {
            bits |= 1
          }
        }

      }
    }

    if bits == 3 {
      return 1
    } else if bits == 118 {
      return 2
    } else if bits == 87 {
      return 3
    }

    return 0
  }

}
