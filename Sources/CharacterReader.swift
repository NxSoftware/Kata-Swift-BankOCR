class CharacterReader {

  class func read(_ sevenSegmentCharacter: String) -> UInt? {
    guard sevenSegmentCharacter.characters.count > 0 else {
      return nil
    }

    let numberOfPipes = sevenSegmentCharacter.characters.reduce(0) { count, character in
      if character == "|" {
        return count + 1
      } else {
        return count
      }
    }

    let numberOfUnderscores = sevenSegmentCharacter.characters.reduce(0) { count, character in
      if character == "_" {
        return count + 1
      } else {
        return count
      }
    }

    switch (numberOfPipes, numberOfUnderscores) {
    case (4, 2):
      return 0
    case (2, 0):
      return 1
    case (2, 3):
      return 2
    default:
      return nil
    }
  }

}
