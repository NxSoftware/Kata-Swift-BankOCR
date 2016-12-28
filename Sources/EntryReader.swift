class EntryReader {

  static let lineLength = 27

  class func read(_ lines: [String]) -> String? {
    guard lines.count == 4 else {
      return nil
    }

    var output = ""

    for i in stride(from: 0, to: lineLength, by: CharacterReader.length) {
      var characterLines = [String]()

      for line in lines.dropLast() {
        characterLines.append(character(atIndex: i, in: line))
      }

      if let character = CharacterReader.read(characterLines) {
        output += String(character)
      }
    }

    return output
  }

  private class func character(atIndex i: Int, in line: String) -> String {
    let start = line.index(line.startIndex, offsetBy: i)
    let end = line.index(start, offsetBy: CharacterReader.length)
    let range = start..<end

    return line[range]
  }

}
