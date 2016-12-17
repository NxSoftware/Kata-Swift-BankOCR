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

    switch numberOfPipes {
    case 4:
      return 0
    case 2:
      return 1
    default:
      return nil
    }
  }

}
