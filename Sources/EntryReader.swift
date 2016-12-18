class EntryReader {

  class func read(_ lines: [String]) -> String? {
    guard lines.count == 4 else {
      return nil
    }

    var output = ""

    for i in stride(from: 0, to: 27, by: 3) {
      var characterLines = [String]()

      for line in lines.dropLast() {

        let start = line.startIndex
        let end = line.index(start, offsetBy: 3)
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
