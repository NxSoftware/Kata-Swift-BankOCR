import Foundation

struct Entry {
  let value: String
  let checksum: Int

  init(value: String) {
    self.value = value
    
    print("Digits for \(value)...")
    let numericValue = Int(value)!
    var runningTotal = 0
    for i in 0..<9 {
      let divisor = Int(pow(10, Double(i)))
      let digit = (numericValue / divisor) % 10
      let result = digit * (i + 1)
      runningTotal += result
    }
    
    checksum = runningTotal % 11
  }
}
