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

    bits |= bitsForLine0(lines[0])
    bits |= bitsForLine1(lines[1])

    for (lineNumber, line) in lines.enumerated() {
      for (charNumber, char) in line.enumerated() {

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

  private class func bitsForLine0(_ line: String.CharacterView) -> Int {
    let index = line.index(after: line.startIndex)
    if line[index] == "_" {
      return 1
    }
    return 0
  }

  private class func bitsForLine1(_ line: String.CharacterView) -> Int {
    var bits = 0
    for x in line.enumerated() {
      switch x {
      case (0, "|"):
        bits |= 32
      case (1, "_"):
        bits |= 64
      case (2, "|"):
        bits |= 2
      default:
        break
      }
    }
    return bits
  }

}
