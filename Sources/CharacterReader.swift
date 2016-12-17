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

    for i in 0..<3 {
      bits |= enabledBits(in: lines[i], forLine: i)
    }

    return bits
  }

  private class func enabledBits(in line: String.CharacterView,
                                 forLine lineNumber: Int) -> Int {
    return line.enumerated().reduce(0) { bit, char in
      let characterBits = bitMap[lineNumber][char.offset]
      return bit | (characterBits[String(char.element)] ?? 0)
    }
  }

  private static let bitMap = [
    [[" ": 0],  ["_": 1],  [" ": 0]],
    [["|": 32], ["_": 64], ["|": 2]],
    [["|": 16], ["_": 8],  ["|": 4]]
  ]

}
