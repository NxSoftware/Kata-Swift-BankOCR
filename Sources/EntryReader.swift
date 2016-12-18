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

        let start = line.startIndex
        let end = line.index(start, offsetBy: CharacterReader.length)
        let range = start..<end

        characterLines.append(line[range])
      }

      if let character = CharacterReader.read(characterLines) {
        output += String(character)
      }
    }

    return output
  }

}
