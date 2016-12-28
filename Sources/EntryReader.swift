class EntryReader {

  static let lineLength = 27

  class func read(_ lines: [String]) -> String? {
    guard lines.count == 4 else {
      return nil
    }

    return characters(in: lines)
  }

  private class func characters(in lines: [String]) -> String {
    return characterStride().reduce("") { output, i in
      return output + characterForDigit(atIndex: i, in: lines)
    }
  }

  private class func characterStride() -> StrideTo<Int> {
    return stride(from: 0, to: lineLength, by: CharacterReader.length)
  }

  private class func characterForDigit(atIndex i: Int, in lines: [String]) -> String {
    let characterLines = componentsForDigit(atIndex: i, in: lines)

    if let character = CharacterReader.read(characterLines) {
      return String(character)
    }
    return ""
  }

  private class func componentsForDigit(atIndex i: Int, in lines: [String]) -> [String] {
    return lines.dropLast().map {
      componentsForDigit(atIndex: i, on: $0)
    }
  }

  private class func componentsForDigit(atIndex i: Int, on line: String) -> String {
    let start = line.index(line.startIndex, offsetBy: i)
    let end = line.index(start, offsetBy: CharacterReader.length)
    return line[start..<end]
  }

}
