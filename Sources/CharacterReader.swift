class CharacterReader {

  class func read(_ sevenSegmentCharacter: String) -> UInt? {
    let charLines = sevenSegmentCharacter.characters.split {
      $0 == "\n"
    }

    return characterBitMap[sevenSegmentBits(charLines)]
  }

  private class func sevenSegmentBits(_ lines: [String.CharacterView]) -> Int {
    return lines.enumerated().reduce(0) { bit, line in
      return bit | enabledBits(in: line.element, forLine: line.offset)
    }
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

  private static let characterBitMap: [Int: UInt] = [
    63:  0,
    6:   1,
    91:  2,
    79:  3,
    102: 4,
    109: 5,
    125: 6,
    7:   7,
    127: 8,
    111: 9
  ]

}
