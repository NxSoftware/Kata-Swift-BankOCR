import Foundation

struct Entry {
  let value: String
  let checksum: Int

  init(value: String) {
    self.value = value
    checksum = Entry.calculateChecksum(for: value)
  }
  
  private static func calculateChecksum(for value: String) -> Int {
    let numericValue = Int(value)!
    var runningTotal = 0
    for i in 0..<value.characters.count {
      let divisor = Int(pow(10, Double(i)))
      let digit = (numericValue / divisor) % 10
      let result = digit * (i + 1)
      runningTotal += result
    }
    return runningTotal % 11
  }
}
