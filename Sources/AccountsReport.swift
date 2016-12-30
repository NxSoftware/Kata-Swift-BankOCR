import Foundation

class AccountsReport {
  
  class func report(_ path: URL) -> String {
    return read(path).joined(separator: "\n")
  }
  
  class func read(_ path: URL) -> [String] {
    return AccountsFileReader.readEntries(path).map(decorate)
  }
  
  private class func decorate(entry: Entry) -> String {
    var result = entry.value
    if entry.isIllegible {
     result += " ILL"
    } else if entry.checksumIsInvalid {
      result += " ERR"
    }
    return result
  }
  
}
