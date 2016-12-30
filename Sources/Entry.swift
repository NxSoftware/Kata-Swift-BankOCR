import Foundation

struct Entry {
  let value: String
  let checksum: Int?
  
  var checksumIsInvalid: Bool {
    return checksum != 0
  }
  
  var isIllegible: Bool {
    return value.contains("?")
  }

  init(value: String) {
    self.value = value
    checksum = Entry.calculateChecksum(for: value)
  }
  
  private static func calculateChecksum(for value: String) -> Int? {
    guard let numericValue = Int(value) else {
      return nil
    }
    
    var runningTotal = 0
    for i in 0..<value.characters.count {
      let divisor = Int(pow(10, Double(i)))
      let digit = (numericValue / divisor) % 10
      runningTotal += (digit * (i + 1))
    }
    return runningTotal % 11
  }
}
